using System;
using System.Web.Services;
using System.Data;


public partial class config_ficha_textos : System.Web.UI.Page
{
    string id = "null";

    protected void Page_Load(object sender, EventArgs e)
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



    [WebMethod]
    public static string saveData(string id, string codigo, string nome, string nome_en, string nome_fr, string nome_es, string texto, string texto_en, string texto_fr, 
        string texto_es, string ordem, string idUser)
    {
        DataSqlServer oDB = new DataSqlServer();

        string sql = "", ret = "1", retMessage = "Dados guardados com sucesso.";

        sql = string.Format(@"  DECLARE @idUser int = {0};
	                            DECLARE @id INT = {1};
	                            DECLARE @codigo varchar(100) = '{2}';
	                            DECLARE @nome varchar(500) = '{3}';
	                            DECLARE @nome_en varchar(500) = '{4}';
	                            DECLARE @nome_fr varchar(500) = '{5}';
	                            DECLARE @nome_es varchar(500) = '{6}';
	                            DECLARE @texto varchar(max) = '{7}';
	                            DECLARE @texto_en varchar(max) = '{8}';
                                DECLARE @texto_fr varchar(max) = '{9}';
                                DECLARE @texto_es varchar(max) = '{10}';
	                            DECLARE @ordem int = {11};
	                            DECLARE @ret int;
                                DECLARE @retMsg VARCHAR(max);

                                EXECUTE CRIA_EDITA_TEXTOS @idUser, @id, @codigo, @nome, @nome_en, @nome_fr, @nome_es, @texto, @texto_en, @texto_fr, @texto_es, @ordem, @ret OUTPUT, @retMsg OUTPUT
                                SELECT @ret ret, @retMsg retMsg ", idUser, String.IsNullOrEmpty(id) ? "NULL" : id, codigo, nome, nome_en, nome_fr, nome_es, texto, texto_en, 
                                    texto_fr, texto_es, ordem);


        DataSet oDs = oDB.GetDataSet(sql, "").oData;

        if (oDB.validaDataSet(oDs))
        {
            ret = oDs.Tables[0].Rows[0]["ret"].ToString().Trim();
            retMessage = oDs.Tables[0].Rows[0]["retMsg"].ToString().Trim();
        }

        return ret + "<#SEP#>" + retMessage;
    }


    [WebMethod]
    public static string getData(string id)
    {
        const string sep = "<#SEP#>";
        string sql = "", codigo = "", nome = "", nome_en = "", nome_fr = "", nome_es = "", texto = "", texto_en = "", texto_fr = "", texto_es = "", ordem = "";

        DataSqlServer oDB = new DataSqlServer();


        sql = string.Format(@"  DECLARE @id int = {0}
                                DECLARE @codigo varchar(100);
                                select
                                    id,
		                            CODIGO,
		                            NOME,
		                            NOME_EN,
		                            NOME_FR,
		                            NOME_ES,
		                            TEXTO,
		                            TEXTO_EN,
		                            TEXTO_FR,
		                            TEXTO_ES,
		                            ordem
                                from REPORT_TEXTOS(@id, @codigo)", id);
        DataSet oDs = oDB.GetDataSet(sql, "").oData;

        if (oDB.validaDataSet(oDs))
        {
            codigo = oDs.Tables[0].Rows[0]["CODIGO"].ToString().Trim();
            nome = oDs.Tables[0].Rows[0]["NOME"].ToString().Trim();
            nome_en = oDs.Tables[0].Rows[0]["NOME_EN"].ToString().Trim();
            nome_fr = oDs.Tables[0].Rows[0]["NOME_FR"].ToString().Trim();
            nome_es = oDs.Tables[0].Rows[0]["NOME_ES"].ToString().Trim();
            texto = oDs.Tables[0].Rows[0]["TEXTO"].ToString().Trim();
            texto_en = oDs.Tables[0].Rows[0]["TEXTO_EN"].ToString().Trim();
            texto_fr = oDs.Tables[0].Rows[0]["TEXTO_FR"].ToString().Trim();
            texto_es = oDs.Tables[0].Rows[0]["TEXTO_ES"].ToString().Trim();
            ordem = oDs.Tables[0].Rows[0]["ordem"].ToString().Trim();

            texto = texto.Replace("<br />", "\n");
            texto_en = texto_en.Replace("<br />", "\n");
            texto_fr = texto_fr.Replace("<br />", "\n");
            texto_es = texto_es.Replace("<br />", "\n");
        }

        // Prepara o retorno dos dados
        return codigo + sep +
              nome + sep +
              nome_en + sep +
              nome_fr + sep +
              nome_es + sep +
              texto + sep +
              texto_en + sep +
              texto_fr + sep +
              texto_es + sep +
              ordem;
    }
}