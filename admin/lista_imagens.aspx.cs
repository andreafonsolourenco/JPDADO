using System;
using System.Web.Services;
using System.Data;
using System.IO;
using System.Collections.Generic;

public partial class lista_imagens : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        getImagesOnServer();
    }

    [WebMethod]
    public static string getGrelha(string img, string admin)
    {
        string sql = "", html = "", htmlOptions = "";
        string id = "", imagem = "", id_portfolio = "", localidade = "", ano = "";

        DataSqlServer oDB = new DataSqlServer();

        html += String.Format(@"<table class='table align-items-center table-flush'>
		                            <thead class='thead-light'>
		                            <tr>
			                            <th scope='col' class='pointer th_text'>Tipo de Img</th>
			                            <th scope='col' class='pointer th_text'>Portfolio</th>
                                        {0}
		                            </tr>
		                            </thead>
                                    <tbody>", admin == "1" ? "<th scope='col'></th>" : "");

        if (string.IsNullOrEmpty(img) || string.IsNullOrWhiteSpace(img))
        {
            html += String.Format(@"<tr><td colspan='{0}'>Imagem não associada!</td></tr>", admin == "1" ? "3" : "2");
            html += "</tbody></table>";
            return html;
        }

        sql = string.Format(@"  DECLARE @img varchar(500) = '{0}';
                                select
                                    id,
		                            id_portfolio,
		                            localidade,
		                            ano,
									imagem
                                from REPORT_PORTFOLIO_IMAGES(null, null, null, @img)
                                union
                                select
	                                0 as id,
                                    id as id_portfolio,
	                                localidade,
	                                ano,
                                    imagem_capa as imagem
                                from report_portfolio(null, null, null, null)
                                where imagem_capa = @img", img);

        DataSet oDs = oDB.GetDataSet(sql, "").oData;
        if (oDB.validaDataSet(oDs))
        {
            for (int j = 0; j < oDs.Tables.Count; j++)
            {
                for (int i = 0; i < oDs.Tables[j].Rows.Count; i++)
                {
                    id = oDs.Tables[j].Rows[i]["id"].ToString().Trim();
                    imagem = oDs.Tables[j].Rows[i]["imagem"].ToString().Trim();
                    id_portfolio = oDs.Tables[j].Rows[i]["id_portfolio"].ToString().Trim();
                    localidade = oDs.Tables[j].Rows[i]["localidade"].ToString().Trim();
                    ano = oDs.Tables[j].Rows[i]["ano"].ToString().Trim();

                    if (admin == "1")
                    {
                        htmlOptions = String.Format(@"  <td class='text-right'>
		                                                    <div class='dropdown'>
			                                                    <a class='btn btn-sm btn-icon-only text-light' href='#' role='button' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>
			                                                        <i class='fas fa-ellipsis-v'></i>
			                                                    </a>
                                                                <div class='dropdown-menu dropdown-menu-right dropdown-menu-arrow'>
			                                                        <a class='dropdown-item' href='#' onclick='eliminar({0},{1});'>Eliminar</a>
			                                                    </div>
                                                            </div>
                                                        </td>", id, id_portfolio);
                    }

                    html += String.Format(@"    <tr class='pointer'>
		                                            <td><span>{0}</span></td>
		                                            <td><span>{1}<br />{2}</span></td>
		                                            {3}                   
	                                            </tr>", id == "0" ? "Capa" : "Portfolio", ano, localidade, htmlOptions);
                }
            }
        }
        else
        {
            html += String.Format(@"<tr><td colspan='{0}'>Imagem não associada!</td></tr>", admin == "1" ? "3" : "2");
        }


        html += "</tbody></table>";


        return html;
    }

    [WebMethod]
    public static string delRow(string id, string idUser, string idPortfolio)
    {
        string sql = "", ret = "1", retMessage = "Registo eliminado com sucesso.";
        DataSqlServer oDB = new DataSqlServer();


        sql = string.Format(@"  DECLARE @id INT = {0};
                                DECLARE @idUser int = {1};
                                DECLARE @ret int
                                DECLARE @retMsg VARCHAR(255)

                                EXEC {2} @iduser, @id, @ret OUTPUT, @retMsg OUTPUT
                                SELECT @ret ret, @retMsg retMsg ", id == "0" ? idPortfolio : id, idUser, id == "0" ? "DELETE_PORTFOLIO_IMAGEM_CAPA" : "DELETE_PORTFOLIO_IMAGE");


        DataSet oDs = oDB.GetDataSet(sql, "").oData;

        if (oDB.validaDataSet(oDs))
        {
            ret = oDs.Tables[0].Rows[0]["ret"].ToString().Trim();
            retMessage = oDs.Tables[0].Rows[0]["retMsg"].ToString().Trim();
        }

        return ret + "<#SEP#>" + retMessage;
    }

    private void getImagesOnServer()
    {
        String searchFolder = Server.MapPath("~") + @"img\portfolio";
        var filters = new String[] { "jpg", "jpeg", "png", "gif", "tiff", "bmp", "svg" };
        var files = GetFilesFrom(searchFolder, filters, false);
        string html = "";

        html += @"  <label class='form-control-label' for='selectImg'>Imagem</label>
                    <select name='selectImg' runat='server' id='selectImg' onChange='getData();' style='width: 100%; height: auto' class='form-control form-control-alternative'>
                        <option value='default'>Selecione uma Imagem</option>";

        foreach (string file in files)
        {
            if (!file.Contains("img\\portfolio\\NoImg.png"))
            {
                string[] path = file.Split('\\');
                html += String.Format(@"<option value='{0}'>{0}</option>", path[path.Length - 1]);
            }
        }

        html += "</select>";

        formImgList.InnerHtml = html;
    }

    public static String[] GetFilesFrom(String searchFolder, String[] filters, bool isRecursive)
    {
        List<String> filesFound = new List<String>();
        var searchOption = isRecursive ? SearchOption.AllDirectories : SearchOption.TopDirectoryOnly;
        foreach (var filter in filters)
        {
            filesFound.AddRange(Directory.GetFiles(searchFolder, String.Format("*.{0}", filter), searchOption));
        }
        return filesFound.ToArray();
    }
}