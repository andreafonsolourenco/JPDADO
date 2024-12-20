using System;
using System.Web.Services;
using System.Data;
using System.Collections.Generic;
using System.IO;

public partial class config_ficha_especialidade : System.Web.UI.Page
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

                                EXEC CRIA_EDITA_ESPECIALIDADE @id, @xml, @error OUTPUT, @errorMsg OUTPUT

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
        string sql = "", nome = "", nome_en = "", nome_fr = "", nome_es = "", ordem = "",
            id_tipo = "", tipo = "", tipo_en = "", tipo_fr = "", tipo_es = "", ordem_tipo = "";

        const string sep = "<#SEP#>";

        DataSqlServer oDB = new DataSqlServer();


        sql = string.Format(@"  set dateformat dmy
                                DECLARE @id int = {0}
                                DECLARE @id_tipo int;

                                select
	                                id,
	                                nome,
	                                nome_en,
	                                nome_fr,
	                                nome_es,
	                                ordem,
	                                id_tipo,
	                                nome_tipo,
	                                nome_en_tipo,
	                                nome_fr_tipo,
	                                nome_es_tipo,
	                                ordem_tipo
                                from report_especialidades(@id, @id_tipo)", id);
        DataSet oDs = oDB.GetDataSet(sql, "").oData;

        if (oDB.validaDataSet(oDs))
        {
            nome = oDs.Tables[0].Rows[0]["nome"].ToString().Trim();
            nome_en = oDs.Tables[0].Rows[0]["nome_en"].ToString().Trim();
            nome_fr = oDs.Tables[0].Rows[0]["nome_fr"].ToString().Trim();
            nome_es = oDs.Tables[0].Rows[0]["nome_es"].ToString().Trim();
            ordem = oDs.Tables[0].Rows[0]["ordem"].ToString().Trim();
            id_tipo = oDs.Tables[0].Rows[0]["id_tipo"].ToString().Trim();
            tipo = oDs.Tables[0].Rows[0]["nome_tipo"].ToString().Trim();
            tipo_en = oDs.Tables[0].Rows[0]["nome_en_tipo"].ToString().Trim();
            tipo_fr = oDs.Tables[0].Rows[0]["nome_fr_tipo"].ToString().Trim();
            tipo_es = oDs.Tables[0].Rows[0]["nome_es_tipo"].ToString().Trim();
            ordem_tipo = oDs.Tables[0].Rows[0]["ordem_tipo"].ToString().Trim();
        }

        // Prepara o retorno dos dados
        return nome + sep +
              nome_en + sep +
              nome_fr + sep +
              nome_es + sep +
              ordem + sep +
              id_tipo + sep +
              tipo + sep +
              tipo_en + sep +
              tipo_fr + sep +
              tipo_es + sep +
              ordem_tipo;
    }

    [WebMethod]
    public static string getSpecTypesList(string search)
    {
        string sql = "", html = "";
        string id = "", nome = "";

        DataSqlServer oDB = new DataSqlServer();

        html += String.Format(@"    <div id='divDialogSearchSpecType'>
                                        <input id='specTypeSearchBar' class='form-control' placeholder='Pesquisar...' type='text' style='color: black; width: 75%; float:left;' value='{0}' />
                                        <img id='specTypeSearchIcon' src='../Img/search_icon.png' style='width: auto; height: calc(2.75rem + 2px); cursor: pointer; margin-left: 5px; float:right;' alt='Pesquisar Tipo de Especialidade' title='Pesquisar Tipo de Especialidade' onclick='getSpecTypeList(true);' />
                                    </div>
                                    <div id='divTableSpecType'>
                                        <table class='table align-items-center table-flush'>
		                                    <thead class='thead-light'>
		                                        <tr>
			                                        <th scope='col' class='pointer th_text'>Tipo de Especialidade</th>>
		                                        </tr>
		                                    </thead>
                                            <tbody>", search);

        sql = String.Format(@"  DECLARE @id int;
                                DECLARE @especialidade varchar(500);
                                select
                                    id,
		                            NOME
                                from REPORT_ESPECIALIDADES_TIPO(@id, @especialidade)
                                where (nome like {0})
                                order by ordem asc", String.Format("'%{0}%'", search));

        DataSet oDs = oDB.GetDataSet(sql, "").oData;
        if (oDB.validaDataSet(oDs))
        {
            for (int j = 0; j < oDs.Tables.Count; j++)
            {
                for (int i = 0; i < oDs.Tables[j].Rows.Count; i++)
                {
                    id = oDs.Tables[j].Rows[i]["id"].ToString().Trim();
                    nome = oDs.Tables[j].Rows[i]["nome"].ToString().Trim();

                    html += String.Format(@"    <tr class='pointer' id='specTypeLine{2}' onclick='selectSpecTypeRow({0},{2});'> 
		                                            <td><span>{1}</span></td>                    
	                                            </tr>", id, nome, i);
                }

                html += "<span class='variaveis' id='countSpecTypes'>" + oDs.Tables[j].Rows.Count + "</span>";
            }
        }
        else
        {
            html += "<tr><td colspan='1'>Não existem tipos de especialidades a apresentar.</td></tr>";
        }


        html += "</tbody></table></div>";

        return html;
    }

    [WebMethod]
    public static string getSpecTypeData(string id, string name)
    {
        string sql = "";
        string sep = "<#SEP#>";
        string nome = "", nome_fr = "", nome_es = "", nome_en = "", ordem = "";

        DataSqlServer oDB = new DataSqlServer();

        sql = String.Format(@"  DECLARE @id int = {0}
                                DECLARE @name varchar(500) = {1};
                                select
                                    id,
		                            NOME,
		                            NOME_EN,
		                            NOME_FR,
		                            NOME_ES,
                                    ordem
                                from REPORT_ESPECIALIDADES_TIPO(@id, @name)", String.IsNullOrEmpty(id) ? "NULL" : id, String.IsNullOrEmpty(name) ? "NULL" : String.Format(@"'{0}'", name));

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
                    ordem = oDs.Tables[j].Rows[i]["ordem"].ToString().Trim();
                }
            }
        }

        return nome + sep + nome_en + sep + nome_fr + sep + nome_es + sep + id + sep + ordem; ;
    }
}