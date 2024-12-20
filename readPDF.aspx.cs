using System;
using System.Web.UI;

public partial class readPDF : Page
{
    string page = "";

    protected void Page_Init(object sender, EventArgs e)
    {

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
        }

        page = Request.QueryString["page"];

        divShowPDF.InnerHtml = @"<iframe src='https://www.jf-muxagata.pt/ficheiros/fic6_1675032810.pdf#toolbar=0&navpanes=0&scrollbar=0' frameborder='0' scrolling='auto' style='width:100%; height:800px;'></iframe>";
    }
}
