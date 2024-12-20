using System;
using System.Web.Services;
using System.Data;


public partial class config_ficha_tipos_portfolio : System.Web.UI.Page
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
    public static string saveData(string id, string nome, string nome_en, string nome_fr, string nome_es, string idUser)
    {
        DataSqlServer oDB = new DataSqlServer();

        string sql = "", ret = "1", retMessage = "Dados guardados com sucesso.";

        sql = string.Format(@"  DECLARE @idUser int = {0};
	                            DECLARE @id INT = {1};
	                            DECLARE @nome varchar(500) = '{2}';
	                            DECLARE @nome_en varchar(500) = '{3}';
	                            DECLARE @nome_fr varchar(500) = '{4}';
	                            DECLARE @nome_es varchar(500) = '{5}';
	                            DECLARE @ret int;
                                DECLARE @retMsg VARCHAR(max);

                                EXECUTE CRIA_EDITA_TIPO_PORTFOLIO @idUser, @id, @nome, @nome_en, @nome_fr, @nome_es, @ret OUTPUT, @retMsg OUTPUT
                                SELECT @ret ret, @retMsg retMsg ", idUser, String.IsNullOrEmpty(id) ? "NULL" : id, nome, nome_en, nome_fr, nome_es);


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
        string sql = "", nome = "", nome_en = "", nome_fr = "", nome_es = "";

        DataSqlServer oDB = new DataSqlServer();


        sql = string.Format(@"  DECLARE @id int = {0}
                                DECLARE @nome varchar(500);
                                select
                                    id,
		                            NOME,
		                            NOME_EN,
		                            NOME_FR,
		                            NOME_ES
                                from REPORT_PORTFOLIO_TIPO(@id, @nome)", id);
        DataSet oDs = oDB.GetDataSet(sql, "").oData;

        if (oDB.validaDataSet(oDs))
        {
            nome = oDs.Tables[0].Rows[0]["NOME"].ToString().Trim();
            nome_en = oDs.Tables[0].Rows[0]["NOME_EN"].ToString().Trim();
            nome_fr = oDs.Tables[0].Rows[0]["NOME_FR"].ToString().Trim();
            nome_es = oDs.Tables[0].Rows[0]["NOME_ES"].ToString().Trim();
        }

        // Prepara o retorno dos dados
        return nome + sep +
              nome_en + sep +
              nome_fr + sep +
              nome_es;
    }
}