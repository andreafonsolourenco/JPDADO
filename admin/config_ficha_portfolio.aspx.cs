using System;
using System.Web.Services;
using System.Data;
using System.Collections.Generic;
using System.IO;

public partial class config_ficha_portfolio : System.Web.UI.Page
{
    string id = "null";

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            try
            {
                id = Request.QueryString["id"];
            }
            catch (Exception)
            {
            }

            txtAux.Value = id;
            getImagesOnServer();
        }
    }

    [WebMethod]
    public static string saveData(string idUser, string xml)
    {
        DataSqlServer oDB = new DataSqlServer();

        string sql = "", ret = "1", retMessage = "Dados guardados com sucesso.";
        sql = string.Format(@"  DECLARE @id INT={0};
                                DECLARE @xml NVARCHAR(MAX)='{1}';
                                DECLARE @error int;
                                DECLARE @errorMsg varchar(max);

                                EXEC CRIA_EDITA_PORTFOLIO @id, @xml, @error OUTPUT, @errorMsg OUTPUT

                                SELECT @error error, @errorMsg errorMsg ", idUser, xml);

        DataSet oDs = oDB.GetDataSet(sql, "").oData;

        if (oDB.validaDataSet(oDs))
        {
            ret = oDs.Tables[0].Rows[0]["error"].ToString().Trim();
            retMessage = oDs.Tables[0].Rows[0]["errorMsg"].ToString().Trim();
        }

        return ret + "<#SEP#>" + retMessage;
    }


    [WebMethod]
    public static string getData(string id)
    {
        string sql = "", localidade = "", texto = "", texto_en = "", texto_fr = "", texto_es = "", empresa = "",
            id_tipo = "", tipo = "", tipo_en = "", tipo_fr = "", tipo_es = "", img = "", ordem = "", ano = "";

        const string sep = "<#SEP#>";

        DataSqlServer oDB = new DataSqlServer();


        sql = string.Format(@"  set dateformat dmy
                                DECLARE @id int = {0}
                                DECLARE @id_tipo int;
                                DECLARE @ano int;
                                DECLARE @localidade varchar(500);

                                select
	                                id,
	                                localidade,
	                                texto,
	                                texto_en,
	                                texto_fr,
	                                texto_es,
	                                empresa,
	                                id_tipo,
	                                tipo,
	                                tipo_en,
	                                tipo_fr,
	                                tipo_es,
	                                imagem_capa,
	                                ordem,
	                                ano
                                from report_portfolio(@id, @id_tipo, @localidade, @ano)", id);
        DataSet oDs = oDB.GetDataSet(sql, "").oData;

        if (oDB.validaDataSet(oDs))
        {
            localidade = oDs.Tables[0].Rows[0]["localidade"].ToString().Trim();
            texto = oDs.Tables[0].Rows[0]["texto"].ToString().Trim();
            texto_en = oDs.Tables[0].Rows[0]["texto_en"].ToString().Trim();
            texto_fr = oDs.Tables[0].Rows[0]["texto_fr"].ToString().Trim();
            texto_es = oDs.Tables[0].Rows[0]["texto_es"].ToString().Trim();
            empresa = oDs.Tables[0].Rows[0]["empresa"].ToString().Trim();
            id_tipo = oDs.Tables[0].Rows[0]["id_tipo"].ToString().Trim();
            tipo = oDs.Tables[0].Rows[0]["tipo"].ToString().Trim();
            tipo_en = oDs.Tables[0].Rows[0]["tipo_en"].ToString().Trim();
            tipo_fr = oDs.Tables[0].Rows[0]["tipo_fr"].ToString().Trim();
            tipo_es = oDs.Tables[0].Rows[0]["tipo_es"].ToString().Trim();
            img = oDs.Tables[0].Rows[0]["imagem_capa"].ToString();
            ordem = oDs.Tables[0].Rows[0]["ordem"].ToString().Trim();
            ano = oDs.Tables[0].Rows[0]["ano"].ToString().Trim();
        }

        // Prepara o retorno dos dados
        return localidade + sep +
              texto + sep +
              texto_en + sep +
              texto_fr + sep +
              texto_es + sep +
              empresa + sep +
              id_tipo + sep +
              tipo + sep +
              tipo_en + sep +
              tipo_fr + sep +
              tipo_es + sep +
              img + sep +
              ordem + sep +
              ano;
    }

    [WebMethod]
    public static string getPortfolioTypesList(string search)
    {
        string sql = "", html = "";
        string id = "", nome = "";

        DataSqlServer oDB = new DataSqlServer();

        html += String.Format(@"    <div id='divDialogSearchPortfolioType'>
                                        <input id='portfolioTypeSearchBar' class='form-control' placeholder='Pesquisar...' type='text' style='color: black; width: 75%; float:left;' value='{0}' />
                                        <img id='portfolioTypeSearchIcon' src='../Img/search_icon.png' style='width: auto; height: calc(2.75rem + 2px); cursor: pointer; margin-left: 5px; float:right;' alt='Pesquisar Tipo de Portfolio' title='Pesquisar Tipo de Portfolio' onclick='getPortfolioTypeList(true);' />
                                    </div>
                                    <div id='divTablePortfolioType'>
                                        <table class='table align-items-center table-flush'>
		                                    <thead class='thead-light'>
		                                        <tr>
			                                        <th scope='col' class='pointer th_text'>Tipo de Portfolio</th>>
		                                        </tr>
		                                    </thead>
                                            <tbody>", search);

        sql = String.Format(@"  DECLARE @id int;
                                DECLARE @nome varchar(500);
                                select
                                    id,
		                            NOME
                                from report_portfolio_tipo(@id, @nome)
                                where (nome like {0})
                                order by nome asc", String.Format("'%{0}%'", search));

        DataSet oDs = oDB.GetDataSet(sql, "").oData;
        if (oDB.validaDataSet(oDs))
        {
            for (int j = 0; j < oDs.Tables.Count; j++)
            {
                for (int i = 0; i < oDs.Tables[j].Rows.Count; i++)
                {
                    id = oDs.Tables[j].Rows[i]["id"].ToString().Trim();
                    nome = oDs.Tables[j].Rows[i]["nome"].ToString().Trim();

                    html += String.Format(@"    <tr class='pointer' id='portfolioTypeLine{2}' onclick='selectPortfolioTypeRow({0},{2});'> 
		                                            <td><span>{1}</span></td>                    
	                                            </tr>", id, nome, i);
                }

                html += "<span class='variaveis' id='countPortfolioTypes'>" + oDs.Tables[j].Rows.Count + "</span>";
            }
        }
        else
        {
            html += "<tr><td colspan='1'>Não existem tipos de portfolio a apresentar.</td></tr>";
        }


        html += "</tbody></table></div>";

        return html;
    }

    [WebMethod]
    public static string getPortfolioTypeData(string id, string name)
    {
        string sql = "";
        string sep = "<#SEP#>";
        string nome = "", nome_fr = "", nome_es = "", nome_en = "";

        DataSqlServer oDB = new DataSqlServer();

        sql = String.Format(@"  DECLARE @id int = {0}
                                DECLARE @name varchar(500) = {1};
                                select
                                    id,
		                            NOME,
		                            NOME_EN,
		                            NOME_FR,
		                            NOME_ES
                                from REPORT_PORTFOLIO_TIPO(@id, @name)", String.IsNullOrEmpty(id) ? "NULL" : id, String.IsNullOrEmpty(name) ? "NULL" : String.Format(@"'{0}'", name));

        DataSet oDs = oDB.GetDataSet(sql, "").oData;
        if (oDB.validaDataSet(oDs))
        {
            for (int j = 0; j < oDs.Tables.Count; j++)
            {
                for (int i = 0; i < oDs.Tables[j].Rows.Count; i++)
                {
                    id = oDs.Tables[j].Rows[i]["id"].ToString().Trim();
                    nome = oDs.Tables[j].Rows[i]["nome"].ToString().Trim();
                    nome_en = oDs.Tables[j].Rows[i]["NOME_EN"].ToString().Trim();
                    nome_fr = oDs.Tables[j].Rows[i]["NOME_FR"].ToString().Trim();
                    nome_es = oDs.Tables[j].Rows[i]["NOME_ES"].ToString().Trim();
                }
            }
        }

        return nome + sep + nome_en + sep + nome_fr + sep + nome_es + sep + id;
    }

    private void getImagesOnServer()
    {
        String searchFolder = Server.MapPath("~") + @"img\portfolio";
        var filters = new String[] { "jpg", "jpeg", "png", "gif", "tiff", "bmp", "svg" };
        var files = GetFilesFrom(searchFolder, filters, false);
        string html = "";

        html += @"  <label class='form-control-label' for='selectImg'>Imagem de Capa</label>
                    <select name='selectImg' runat='server' id='selectImg' onChange='onSelectImageChange();' style='width: 100%; height: auto' class='form-control form-control-alternative'>
                        <option value='default'>Sem Imagem de Capa</option>";

        foreach(string file in files)
        {
            if(!file.Contains("img\\portfolio\\NoImg.png"))
            {
                string[] path = file.Split('\\');
                html += String.Format(@"<option value='{0}'>{0}</option>", path[path.Length - 1]);
            }
        }

        html += "</select>";

        portfolioSelectImageFormGroup.InnerHtml = html;
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