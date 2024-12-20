using System;
using System.Web.Services;
using System.Data;

public partial class dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    [WebMethod]
    public static string getGrafico()
    {
        string sql = "", ret = "", nr = "", ano = "";
        DataSqlServer oDB = new DataSqlServer();


        sql = @"select
                    nr,
		            ano
                from REPORT_GRAPHIC_DATA()";

        DataSet oDs = oDB.GetDataSet(sql, "").oData;

        if (oDB.validaDataSet(oDs))
        {
            for (int j = 0; j < oDs.Tables.Count; j++)
            {
                for (int i = 0; i < oDs.Tables[j].Rows.Count; i++)
                {
                    if(i > 0)
                    {
                        ret += "<#SEP#>";
                    }

                    nr = oDs.Tables[j].Rows[i]["nr"].ToString().Trim();
                    ano = oDs.Tables[j].Rows[i]["ano"].ToString().Trim();

                    ret += ano + "@" + nr;
                }
            }
        }

        return ret;
    }

    [WebMethod]
    public static string getObrasAno()
    {
        string sql = "", html = "";
        string ano = "", nr_obras = "";
        DataSqlServer oDB = new DataSqlServer();

        html += @"  <table class='table align-items-center table-flush'>
		                <thead class='thead-light'>
		                    <tr>
                                <th scope='col'>Ano</th>
                                <th scope='col'>Nº Obras</th>
		                    </tr>
		                </thead>
                        <tbody>";


        sql = @"select
                    nr,
		            ano
                from REPORT_GRAPHIC_DATA()";

        DataSet oDs = oDB.GetDataSet(sql, "").oData;
        if (oDB.validaDataSet(oDs))
        {
            for (int j = 0; j < oDs.Tables.Count; j++)
            {
                for (int i = 0; i < oDs.Tables[j].Rows.Count; i++)
                {
                    ano = oDs.Tables[j].Rows[i]["ano"].ToString().Trim();
                    nr_obras = oDs.Tables[j].Rows[i]["nr"].ToString().Trim();

                    html += String.Format(@"<tr style='cursor:pointer;'>
		                                        <td>{0}</td>
                                                <td>{1}</td>
	                                        </tr>", ano, nr_obras);
                }
            }
        }

        html += "</tbody></table>";

        return html;
    }
}