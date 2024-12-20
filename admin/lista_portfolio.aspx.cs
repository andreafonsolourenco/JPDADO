using System;
using System.Web.Services;
using System.Data;
using System.IO;
using Microsoft.VisualBasic.ApplicationServices;
using static System.Net.Mime.MediaTypeNames;

public partial class lista_portfolio : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string getGrelha(string pesquisa, string order, string admin)
    {
        string sql = "", html = "", htmlOptions = "";
        string id = "", localidade = "", empresa = "", tipo = "", ordem = "", ano = "";

        DataSqlServer oDB = new DataSqlServer();

        html += String.Format(@"<table class='table align-items-center table-flush'>
		                            <thead class='thead-light'>
		                            <tr>
			                            <th scope='col' class='pointer th_text' onclick='ordenaAno();'>Ano</th>
                                        <th scope='col' class='pointer th_text' onclick='ordenaProjeto();'>Projeto</th>
                                        {0}
		                            </tr>
		                            </thead>
                                    <tbody>", admin == "1" ? "<th scope='col'></th>" : "");

        sql = string.Format(@"  declare @id int;
                                declare @id_tipo int;
                                declare @localidade varchar(500);
                                declare @ano int;

                                select
	                                id,
	                                localidade,
	                                texto,
	                                empresa,
	                                id_tipo,
	                                tipo,
	                                ordem,
	                                ano
                                from report_portfolio(@id, @id_tipo, @localidade, @ano)
                                where (localidade like {0} or empresa like {0} or tipo like {0} or ordem like {0} or ano like {0})
                                {1}", String.Format("'%{0}%'", pesquisa), order);

        DataSet oDs = oDB.GetDataSet(sql, "").oData;
        if (oDB.validaDataSet(oDs))
        {
            for (int j = 0; j < oDs.Tables.Count; j++)
            {
                for (int i = 0; i < oDs.Tables[j].Rows.Count; i++)
                {
                    id = oDs.Tables[j].Rows[i]["id"].ToString().Trim();
                    localidade = oDs.Tables[j].Rows[i]["localidade"].ToString().Trim();
                    empresa = oDs.Tables[j].Rows[i]["empresa"].ToString().Trim();
                    tipo = oDs.Tables[j].Rows[i]["tipo"].ToString().Trim();
                    ordem = oDs.Tables[j].Rows[i]["ordem"].ToString().Trim();
                    ano = oDs.Tables[j].Rows[i]["ano"].ToString().Trim();

                    if (admin == "1")
                    {
                        htmlOptions = String.Format(@"  <td class='text-right'>
		                                                    <div class='dropdown'>
			                                                    <a class='btn btn-sm btn-icon-only text-light' href='#' role='button' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>
			                                                        <i class='fas fa-ellipsis-v'></i>
			                                                    </a>
                                                                <div class='dropdown-menu dropdown-menu-right dropdown-menu-arrow'>
                                                                    <a class='dropdown-item' href='#' onclick='uploadImgPortfolio({0});'>Upload Img Portfolio</a>
                                                                    <a class='dropdown-item' href='#' onclick='uploadImgCapa({0});'>Upload Img Capa</a>
			                                                        <a class='dropdown-item' href='#' onclick='editar({0});'>Editar</a>
                                                                    <a class='dropdown-item' href='#' onclick='eliminar({0});'>Eliminar</a>
			                                                    </div>
                                                            </div>
                                                        </td>", id);
                    }

                    html += String.Format(@"    <tr class='pointer' ondblclick='editar({0});'>
		                                            <td><span>{1}</span></td>
                                                    <td><span>{5}<br />{3}{4}</span></td>
		                                            {6}                   
	                                            </tr>", id, ano, ordem, localidade, String.IsNullOrEmpty(empresa) ? "" : "<br />" + empresa, tipo, htmlOptions);
                }
            }
        }
        else
        {
            html += String.Format(@"<tr><td colspan='{0}'>Não existem portfolios a apresentar.</td></tr>", admin == "1" ? "3" : "2");
        }


        html += "</tbody></table>";


        return html;
    }

    [WebMethod]
    public static string delRow(string id, string idUser)
    {
        string sql = "", ret = "1", retMessage = "Registo eliminado com sucesso.";
        DataSqlServer oDB = new DataSqlServer();


        sql = string.Format(@"  DECLARE @id INT = {0};
                                DECLARE @idUser int = {1};
                                DECLARE @ret int
                                DECLARE @retMsg VARCHAR(255)

                                EXEC DELETE_PORTFOLIO @idUser, @id, @ret OUTPUT, @retMsg OUTPUT
                                SELECT @ret ret, @retMsg retMsg ", id, idUser);


        DataSet oDs = oDB.GetDataSet(sql, "").oData;

        if (oDB.validaDataSet(oDs))
        {
            ret = oDs.Tables[0].Rows[0]["ret"].ToString().Trim();
            retMessage = oDs.Tables[0].Rows[0]["retMsg"].ToString().Trim();
        }

        return ret + "<#SEP#>" + retMessage;
    }

    protected void Upload_Click(object sender, EventArgs e)
    {
        DataSqlServer oDB = new DataSqlServer();

        if (!FileUploadControl.HasFile)
        {
            uploadFileSuccess.InnerHtml = "";
            uploadFileDanger.InnerHtml = "Por favor, selecione um ficheiro!";
            return;
        }

        if (!FileUploadControl.HasFile)
        {
            uploadFileSuccess.InnerHtml = "";
            uploadFileDanger.InnerHtml = "Por favor, selecione um ficheiro!";
            return;
        }

        if (FileUploadControl.HasFile)
        {
            try
            {
                string filename = Path.GetFileName(FileUploadControl.FileName);
                string extension = Path.GetExtension(FileUploadControl.FileName);
                string pathToSave = Server.MapPath("~") + "uploaded_files/Portfolio_" + DateTime.Now.ToShortDateString().Replace("/", "") + "_" + DateTime.Now.ToLocalTime().ToShortTimeString().Replace(":", "") + extension;
                
                if(!extension.Contains("csv") && !extension.Contains("xls"))
                {
                    uploadFileSuccess.InnerHtml = "";
                    uploadFileDanger.InnerHtml = "Por favor, selecione um ficheiro Excel válido! (*.csv | *.xls | *.xlsx)";
                    return;
                }

                FileUploadControl.SaveAs(pathToSave);

                if (oDB.insertCSVFileIntoDB(pathToSave, "PORTFOLIO", userID.Text))
                {
                    uploadFileSuccess.InnerHtml = "Portfolio Carregados com sucesso!";
                    uploadFileDanger.InnerHtml = "";
                    return;
                }
                else
                {
                    uploadFileSuccess.InnerHtml = "";
                    uploadFileDanger.InnerHtml = "Ocorreu um erro ao carregar o ficheiro!";
                    return;
                }
            }
            catch (Exception ex)
            {
                uploadFileSuccess.InnerHtml = "";
                uploadFileDanger.InnerHtml = "Ocorreu um erro ao carregar o ficheiro: " + ex.ToString();
                return;
            }
        }
    }

    protected void UploadImage_Click(object sender, EventArgs e)
    {
        string sql = "", ret = "1", retMessage = "Imagem carregada com sucesso!";
        DataSqlServer oDB = new DataSqlServer();

        if (!ImageUploadControl.HasFile)
        {
            msgReturned.InnerHtml = "Por favor, selecione uma imagem num formato válido!";
            return;
        }

        if (!ImageUploadControl.HasFile)
        {
            msgReturned.InnerHtml = "Por favor, selecione uma imagem num formato válido!";
            return;
        }

        if (ImageUploadControl.HasFile)
        {
            try
            {
                string idUser = userID.Text.ToString();
                string idPortfolio = portfolioID.Text.ToString();
                string filename = Path.GetFileName(ImageUploadControl.FileName).Replace(" ", "_");
                string extension = Path.GetExtension(ImageUploadControl.FileName);
                string pathToSave = Server.MapPath("~") + "img/portfolio/" + filename;
                var filters = new String[] { "jpg", "jpeg", "png", "gif", "tiff", "bmp", "svg" };
                bool exists = false;

                foreach(string filter in filters)
                {
                    if(extension.Contains(filter))
                    {
                        exists = true;
                        break;
                    }
                }

                if (!exists)
                {
                    msgReturned.InnerHtml = "Por favor, selecione uma imagem num formato válido!";
                    return;
                }

                if(portfolioFlag.Text != null && portfolioFlag.Text.ToString() == "0")
                {
                    sql = string.Format(@"  DECLARE @id INT = {1};
                                            DECLARE @idUser int = {0};
                                            DECLARE @imagem varchar(500) = '{2}';
                                            DECLARE @ret int
                                            DECLARE @retMsg VARCHAR(255)

                                            exec CRIA_EDITA_IMAGEM_CAPA @idUser, @id, @imagem, @ret OUTPUT, @retMsg OUTPUT
                                            SELECT @ret ret, @retMsg retMsg ", idUser, idPortfolio, filename);
                }
                else
                {
                    sql = string.Format(@"  DECLARE @id INT;
                                            DECLARE @idUser int = {0};
                                            DECLARE @id_portfolio int = {1};
                                            DECLARE @imagem varchar(500) = '{2}';
                                            DECLARE @ordem int = (select isnull(max(ordem), 0) + 1 from report_portfolio_images(@id, @id_portfolio, null, null))
                                            DECLARE @fromCsvFile bit = 0;
                                            DECLARE @ret int
                                            DECLARE @retMsg VARCHAR(255)

                                            exec CRIA_EDITA_IMAGEM_PORTFOLIO @idUser, @id, @id_portfolio, @imagem, @ordem, @fromCsvFile, @ret OUTPUT, @retMsg OUTPUT;
                                            SELECT @ret ret, @retMsg retMsg ", idUser, idPortfolio, filename);
                }

                DataSet oDs = oDB.GetDataSet(sql, "").oData;

                if (oDB.validaDataSet(oDs))
                {
                    ret = oDs.Tables[0].Rows[0]["ret"].ToString().Trim();
                    retMessage = oDs.Tables[0].Rows[0]["retMsg"].ToString().Trim();
                    ImageUploadControl.SaveAs(pathToSave);
                    msgReturned.InnerHtml = retMessage;
                    return;
                }

                msgReturned.InnerHtml = "Ocorreu um erro ao carregar a imagem!";
                return;
            }
            catch (Exception ex)
            {
                msgReturned.InnerHtml = "Ocorreu um erro ao carregar a imagem: " + ex.ToString();
                return;
            }
        }
    }
}