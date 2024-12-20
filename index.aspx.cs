using System;
using System.Web.UI;
using System.Web.Services;
using System.Configuration;
using System.Data;
using System.Text;
using System.Web;
using System.Data.SqlClient;
using System.Net.Mail;
using System.IO;

public partial class index : Page
{
    protected void Page_Init(object sender, EventArgs e)
    {

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
        }

        loadImagesNames();
        getAbout();
        getTextos();
        getEspecialidades();
        getPortfolio();
        getContactos();
    }

    private void getEspecialidades()
    {
        var table = new StringBuilder();
        string connectionstring = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
        SqlConnection connection = new SqlConnection(connectionstring);
        SqlDataAdapter da = new SqlDataAdapter();
        SqlCommand command = new SqlCommand();
        command.Connection = connection;
        string tipo = "";

        try
        {
            string sql = string.Format(@"   SET DATEFORMAT dmy;
                                            DECLARE @id_tipo int
                                            DECLARE @id_especialidade int
                                            DECLARE @lingua varchar(10)
                                            select tipo_especialidade, especialidade, ordem_especialidade, ordem_tipo
                                            from JPDADO_REPORT_ESPECIALIDADES(@id_especialidade, @id_tipo, @lingua)
                                            order by ordem_tipo, ordem_especialidade");

            command.CommandText = sql.ToString();
            da.SelectCommand = command;
            DataSet oDs = new DataSet();

            connection.Open();
            da.Fill(oDs);
            connection.Close();

            if (oDs.Tables != null && oDs.Tables.Count > 0 && oDs.Tables[0].Rows.Count > 0)
            {
                table.AppendFormat(@"<h3>Especialidades</h3>");
                for (int i = 0; i < oDs.Tables[0].Rows.Count; i++)
                {
                    if(tipo == "")
                    {
                        tipo = oDs.Tables[0].Rows[i]["tipo_especialidade"].ToString();
                        table.AppendFormat(@"<div class='w3-col l4 m6 w3-margin-bottom'><p class='w3-opacity'>{0}</p><p>", tipo);
                    }
                    else
                    {
                        if(tipo != oDs.Tables[0].Rows[i]["tipo_especialidade"].ToString())
                        {
                            tipo = oDs.Tables[0].Rows[i]["tipo_especialidade"].ToString();
                            table.AppendFormat(@"</p></div><div class='w3-col l4 m6 w3-margin-bottom'><p class='w3-opacity'>{0}</p><p>", tipo);
                        }
                        else
                        {
                            table.AppendFormat(@";<br />");
                        }
                    }

                    table.AppendFormat(@"- {0}", oDs.Tables[0].Rows[i]["especialidade"].ToString());
                }

                table.AppendFormat(@"</p></div>");
            }
            else
            {
                
            }
        }
        catch (Exception exc)
        {
            divEspecialidades.InnerHtml = exc.ToString();
        }

        divEspecialidades.InnerHtml = table.ToString();
    }

    private void getAbout()
    {
        var table = new StringBuilder();
        string connectionstring = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
        SqlConnection connection = new SqlConnection(connectionstring);
        SqlDataAdapter da = new SqlDataAdapter();
        SqlCommand command = new SqlCommand();
        command.Connection = connection;

        try
        {
            string sql = string.Format(@"   SET DATEFORMAT dmy;
                                            DECLARE @id_texto int
                                            DECLARE @codigo varchar(100) = 'ABOUT'
                                            DECLARE @lingua varchar(10)
                                            select nome, texto
                                            from JPDADO_REPORT_TEXTOS(@codigo, @id_texto, @lingua)");

            command.CommandText = sql.ToString();
            da.SelectCommand = command;
            DataSet oDs = new DataSet();

            connection.Open();
            da.Fill(oDs);
            connection.Close();

            if (oDs.Tables != null && oDs.Tables.Count > 0 && oDs.Tables[0].Rows.Count > 0)
            {
                table.AppendFormat(@"<h3 class='w3-border-bottom w3-border-light-grey w3-padding-16'>{0}</h3><p>", oDs.Tables[0].Rows[0]["nome"].ToString());
                for (int i = 0; i < oDs.Tables[0].Rows.Count; i++)
                {
                    table.AppendFormat(@"{0}", oDs.Tables[0].Rows[i]["texto"].ToString());
                }

                table.AppendFormat(@"</p>");
            }
            else
            {

            }
        }
        catch (Exception exc)
        {
            about.InnerHtml = exc.ToString();
        }

        about.InnerHtml = table.ToString();
    }

    private void getTextos()
    {
        var table = new StringBuilder();
        string connectionstring = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
        SqlConnection connection = new SqlConnection(connectionstring);
        SqlDataAdapter da = new SqlDataAdapter();
        SqlCommand command = new SqlCommand();
        command.Connection = connection;

        try
        {
            string sql = string.Format(@"   SET DATEFORMAT dmy;
                                            DECLARE @id_texto int
                                            DECLARE @codigo varchar(100)
                                            DECLARE @lingua varchar(10)
                                            select nome, texto
                                            from JPDADO_REPORT_TEXTOS(@codigo, @id_texto, @lingua)
                                            where codigo <> 'ABOUT'
                                            order by ordem asc");

            command.CommandText = sql.ToString();
            da.SelectCommand = command;
            DataSet oDs = new DataSet();

            connection.Open();
            da.Fill(oDs);
            connection.Close();

            if (oDs.Tables != null && oDs.Tables.Count > 0 && oDs.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < oDs.Tables[0].Rows.Count; i++)
                {
                    table.AppendFormat(@"<div class='w3-col l3 m6 w3-margin-bottom'><h3>{0}</h3><p>{1}</p></div>", oDs.Tables[0].Rows[i]["nome"].ToString(), oDs.Tables[0].Rows[i]["texto"].ToString());
                }
            }
            else
            {

            }
        }
        catch (Exception exc)
        {
            textos.InnerHtml = exc.ToString();
        }

        textos.InnerHtml = table.ToString();
    }

    private void getContactos()
    {
        var table = new StringBuilder();
        string connectionstring = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
        SqlConnection connection = new SqlConnection(connectionstring);
        SqlDataAdapter da = new SqlDataAdapter();
        SqlCommand command = new SqlCommand();
        command.Connection = connection;

        try
        {
            string sql = string.Format(@"   SET DATEFORMAT dmy;
                                            select nome, morada1, morada2, cod_postal, localidade
                                            from JPDADO_REPORT_CONTACTOS()");

            command.CommandText = sql.ToString();
            da.SelectCommand = command;
            DataSet oDs = new DataSet();

            connection.Open();
            da.Fill(oDs);
            connection.Close();

            if (oDs.Tables != null && oDs.Tables.Count > 0 && oDs.Tables[0].Rows.Count > 0)
            {
                table.AppendFormat(@"<h3 class='w3-border-bottom w3-border-light-grey w3-padding-16' style='padding-top: 5px;'>Contactos</h3><p>");

                for (int i = 0; i < oDs.Tables[0].Rows.Count; i++)
                {
                    table.AppendFormat(@"{0}<br />{1}<br />{2}<br />{3} {4}", oDs.Tables[0].Rows[i]["nome"].ToString(), 
                        oDs.Tables[0].Rows[i]["morada1"].ToString(), 
                        oDs.Tables[0].Rows[i]["morada2"].ToString(), 
                        oDs.Tables[0].Rows[i]["cod_postal"].ToString(),
                        oDs.Tables[0].Rows[i]["localidade"].ToString());
                }

                table.AppendFormat(@"   </p><input class='w3-input w3-border' type='text' placeholder='Nome' required name='Nome' id='nome' />
                                        <input class='w3-input w3-section w3-border' type='text' placeholder='Email' required name='Email' id='email' />
                                        <input class='w3-input w3-section w3-border' type='text' placeholder='Assunto' required name = 'Assunto' id='assunto' />
                                        <textarea class='w3-input w3-section w3-border' placeholder='Escreva aqui o seu texto...' required name='Texto' rows='5' id='texto'></textarea>
                                        <input class='form-control btn' style='margin-bottom: 20px;' type='button' value='ENVIAR' onclick='sendEmail();' />
                                        <div style='width: 100%; height: auto; text-align: center; margin-bottom: 20px !important;' >
                                            <span style='display: none; color: red;' id='errorMsgEmail'></span>
                                            <span style='display: none; color: green;' id='successMsgEmail'></span>
                                        </div>

                                        <div id='googleMap' style='width: 100%; height: 450px;'>
                                            <iframe src = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3108.3179516912437!2d-9.281075684189533!3d38.825178579581724!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd1ed18011069ccd%3A0x617256d63a0f32a7!2sR.+das+Sargaceiras%2C+2715-311+Almargem+do+Bpo.!5e0!3m2!1spt-PT!2spt!4v1535991298319' frameborder='0' style='border: 0; width: 100%; height: 100%;' allowfullscreen></iframe>
                                        </div>");
            }
            else
            {

            }
        }
        catch (Exception exc)
        {
            contact.InnerHtml = exc.ToString();
        }

        contact.InnerHtml = table.ToString();
    }

    private void getPortfolio()
    {
        getPortfolioYears();
    }

    private void getPortfolioYears()
    {
        var table = new StringBuilder();
        string connectionstring = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
        SqlConnection connection = new SqlConnection(connectionstring);
        SqlDataAdapter da = new SqlDataAdapter();
        SqlCommand command = new SqlCommand();
        command.Connection = connection;

        try
        {
            string sql = string.Format(@"   SET DATEFORMAT dmy;
                                            DECLARE @ano int;
                                            DECLARE @id_tipo int;
                                            DECLARE @id int;
                                            DECLARE @lingua varchar(10);
                                            select distinct ano
                                            from JPDADO_REPORT_PORTFOLIO(@id, @id_tipo, @ano, @lingua)
                                            order by ano asc");

            command.CommandText = sql.ToString();
            da.SelectCommand = command;
            DataSet oDs = new DataSet();

            connection.Open();
            da.Fill(oDs);
            connection.Close();

            if (oDs.Tables != null && oDs.Tables.Count > 0 && oDs.Tables[0].Rows.Count > 0)
            {
                table.AppendFormat(@"<h3 class='w3-border-bottom w3-border-light-grey w3-padding-16'>Portfolio</h3>");
                for (int i = 0; i < oDs.Tables[0].Rows.Count; i++)
                {
                    var ano = oDs.Tables[0].Rows[i]["ano"].ToString();
                    table.AppendFormat(@"   <p class='w3-opacity'>
                                                <input class='form-control btn' type='button' value='{0}' onclick='showPortfolio({0});'/>
                                            </p>", ano);

                    table.AppendFormat(@"{0}", getPortfolioTitles(ano));
                }
            }
            else
            {

            }
        }
        catch (Exception exc)
        {
            projects.InnerHtml = exc.ToString();
        }

        projects.InnerHtml = table.ToString();
    }

    private string getPortfolioTitles(string ano)
    {
        var table = new StringBuilder();
        string connectionstring = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
        SqlConnection connection = new SqlConnection(connectionstring);
        SqlDataAdapter da = new SqlDataAdapter();
        SqlCommand command = new SqlCommand();
        command.Connection = connection;

        try
        {
            string sql = string.Format(@"   SET DATEFORMAT dmy;
                                            DECLARE @ano int = {0};
                                            DECLARE @id_tipo int;
                                            DECLARE @id int;
                                            DECLARE @lingua varchar(10);
                                            select ano, empresa, tipo, id_tipo, count(id) as nr
                                            from JPDADO_REPORT_PORTFOLIO(@id, @id_tipo, @ano, @lingua)
                                            group by ano, empresa, tipo, id_tipo
                                            order by ano asc, empresa desc, nr desc", ano);

            command.CommandText = sql.ToString();
            da.SelectCommand = command;
            DataSet oDs = new DataSet();

            connection.Open();
            da.Fill(oDs);
            connection.Close();

            if (oDs.Tables != null && oDs.Tables.Count > 0 && oDs.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < oDs.Tables[0].Rows.Count; i++)
                {
                    var empresaStrBld = new StringBuilder();
                    var empresa = oDs.Tables[0].Rows[i]["empresa"].ToString();
                    var id_tipo = oDs.Tables[0].Rows[i]["id_tipo"].ToString();

                    if (String.IsNullOrEmpty(oDs.Tables[0].Rows[i]["empresa"].ToString()))
                    {
                        empresaStrBld.AppendFormat(@"");
                    }
                    else
                    {
                        empresaStrBld.AppendFormat(@"<span class='w3-padding w3-black w3-opacity-min'><b>{0}</b></span>", empresa);
                    }

                    table.AppendFormat(@"   <p class='ano{0}'>
                                                {1}
                                                <span class='w3-hide-small w3-text-green'>{2}</span>
                                            </p>",  ano,
                                                    empresaStrBld.ToString(), 
                                                    oDs.Tables[0].Rows[i]["tipo"].ToString());

                    table.AppendFormat(@"{0}", getPortfolioLines(ano, empresa, id_tipo));
                }
            }
            else
            {

            }
        }
        catch (Exception exc)
        {
            return exc.ToString();
        }

        return table.ToString();
    }

    private string getPortfolioLines(string ano, string empresa, string id_tipo)
    {
        var table = new StringBuilder();
        string connectionstring = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
        SqlConnection connection = new SqlConnection(connectionstring);
        SqlDataAdapter da = new SqlDataAdapter();
        SqlCommand command = new SqlCommand();
        command.Connection = connection;

        try
        {
            string sql = string.Format(@"   SET DATEFORMAT dmy;
                                            DECLARE @ano int = {0};
                                            DECLARE @id_tipo int = {1};
                                            DECLARE @empresa varchar(250) = '{2}';
                                            DECLARE @id int;
                                            DECLARE @lingua varchar(10);
                                            select id, texto, localidade, imagem_capa, ordem, empresa
                                            from JPDADO_REPORT_PORTFOLIO(@id, @id_tipo, @ano, @lingua)
                                            where empresa = @empresa
                                            order by ordem", ano, id_tipo, empresa);

            command.CommandText = sql.ToString();
            da.SelectCommand = command;
            DataSet oDs = new DataSet();

            connection.Open();
            da.Fill(oDs);
            connection.Close();

            if (oDs.Tables != null && oDs.Tables.Count > 0 && oDs.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < oDs.Tables[0].Rows.Count; i++)
                {
                    var img = new StringBuilder();
                    var localidade = oDs.Tables[0].Rows[i]["localidade"].ToString();
                    var texto = oDs.Tables[0].Rows[i]["texto"].ToString();
                    var img_capa = oDs.Tables[0].Rows[i]["imagem_capa"].ToString();
                    var id = oDs.Tables[0].Rows[i]["id"].ToString();

                    if (String.IsNullOrEmpty(img_capa))
                    {
                        img.AppendFormat(@"");
                    }
                    else
                    {
                        img.AppendFormat(@"<img src='img/portfolio/{0}' alt='{1}' style='width:100%'>", img_capa, localidade);
                    }

                    if(i==0 || i % 2 == 0)
                    {
                        table.AppendFormat(@"<div class='w3-row-padding ano{0}'>", ano);
                    }

                    table.AppendFormat(@"   <div class='w3-col l6 m6 w3-margin-bottom' onclick='buildMyCarousel({3});' style='cursor: pointer;'>
                                                {0}
                                                <div class='w3-display-container divPortfolioMargin'>
                                                    <div class='w3-display-topleft w3-black w3-padding'>{2}</div>
                                                    {1}
                                                </div>
                                            </div>", texto, img.ToString(), localidade, id);

                    if ((i % 2 != 0) || (i == (oDs.Tables[0].Rows.Count - 1) && i % 2 == 0))
                    {
                        table.AppendFormat(@"</div>");
                    }
                }
            }
            else
            {

            }
        }
        catch (Exception exc)
        {
            return exc.ToString();
        }

        return table.ToString();
    }

    private void loadImagesNames()
    {
        var table = new StringBuilder();
        string connectionstring = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
        SqlConnection connection = new SqlConnection(connectionstring);
        SqlDataAdapter da = new SqlDataAdapter();
        SqlCommand command = new SqlCommand();
        command.Connection = connection;

        try
        {
            string sql = string.Format(@"   SET DATEFORMAT dmy;
                                            DECLARE @img varchar(500);

                                            select imagem, ordem
                                            from JPDADO_REPORT_MAIN_IMAGES(@img)
                                            order by ordem, imagem");

            command.CommandText = sql.ToString();
            da.SelectCommand = command;
            DataSet oDs = new DataSet();

            connection.Open();
            da.Fill(oDs);
            connection.Close();

            if (oDs.Tables != null && oDs.Tables.Count > 0 && oDs.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < oDs.Tables[0].Rows.Count; i++)
                {
                    table.AppendFormat(@"<span class='variaveis' id='img{0}'>{1}</span>", i.ToString(), oDs.Tables[0].Rows[i]["imagem"].ToString());
                }

                table.AppendFormat(@"<span class='variaveis' id='countNrImg'>{0}</span>", oDs.Tables[0].Rows.Count.ToString());
            }
            else
            {

            }
        }
        catch (Exception exc)
        {
            imgNamesDiv.InnerHtml = exc.ToString();
        }

        imgNamesDiv.InnerHtml = table.ToString();
    }

    [WebMethod]
    public static string loadImagesCarousel(string id)
    {
        var table = new StringBuilder();
        DataSqlServer oDB = new DataSqlServer();

        try
        {
            string sql = string.Format(@"   SET DATEFORMAT dmy;
                                            DECLARE @id int;
                                            DECLARE @id_portfolio int = {0};
                                            DECLARE @id_tipo int;
                                            DECLARE @ano int;
                                            DECLARE @img varchar(500);
                                            DECLARE @lingua varchar(10);

                                            select
                                                id,
		                                        imagem,
		                                        ordem,
		                                        id_portfolio,
		                                        localidade,
		                                        texto
                                            from JPDADO_REPORT_PORTFOLIO_IMAGES(@id, @img, @id_portfolio, @id_tipo, @ano, @lingua)
                                            order by ordem", id);

            DataSet oDs = oDB.GetDataSet(sql, "").oData;
            if (oDB.validaDataSet(oDs))
            {
                int rows = oDs.Tables[0].Rows.Count;

                table.AppendFormat(@"<ol class='carousel-indicators'>");

                for (int i = 0; i < rows; i++)
                {
                    table.AppendFormat(@"<li data-target='#myCarousel' data-slide-to='{0}' {1}></li>", i.ToString(), i == 0 ? "class='active'" : "");
                }

                table.AppendFormat(@"</ol><div class='carousel-inner'>");

                for (int i = 0; i < rows; i++)
                {
                    var imagem = oDs.Tables[0].Rows[i]["imagem"].ToString();
                    var localidade = oDs.Tables[0].Rows[i]["localidade"].ToString();
                    var texto = oDs.Tables[0].Rows[i]["texto"].ToString();

                    table.AppendFormat(@"   <div class='item {1} img_slider'>
                                                <img src='img/portfolio/{0}' alt='{2} - {3}' />
                                                <div class='carousel-caption'>
                                                    <h3>{2}</h3>
                                                    <p>{3}</p>
                                                </div>
                                            </div>", imagem, i == 0 ? "active" : "", localidade, texto);
                }

                table.AppendFormat(@"</div>
                                        <a class='left carousel-control' href='#myCarousel' data-slide='prev'>
                                            <span class='glyphicon glyphicon-chevron-left'></span>
                                            <span class='sr-only'>{0}</span>
                                        </a>
                                        <a class='right carousel-control' href='#myCarousel' data-slide='next'>
                                            <span class='glyphicon glyphicon-chevron-right'></span>
                                            <span class='sr-only'>{1}</span>
                                        </a>", "Previous", "Next");
            }
            else
            {

            }
        }
        catch (Exception exc)
        {

        }

        return table.ToString();
    }

    [WebMethod]
    public static string sendEmailFromTemplate(string assunto, string nome, string email, string body)
    {
        try
        {
            MailMessage mailMessage = new MailMessage();
            string emailBody = "";
            string emailTo = "jogaboliveira@gmail.com";

            string newsletterText = string.Empty;
            newsletterText = File.ReadAllText(HttpContext.Current.Server.MapPath("~") + "\\templates\\template_email.html");

            emailBody += "Nome: " + nome + "<br />";
            emailBody += "Email: " + email + "<br />";
            emailBody += body.Replace("\n", "<br />") + "<br /><br />";
 
            // ------------------------------------
            // Processa o template 
            // ------------------------------------
            newsletterText = newsletterText.Replace("[EMAIL_INTRO]", "Email de Contacto através do site www.jpdado.pt<br />" + assunto);
            newsletterText = newsletterText.Replace("[EMAIL_TEXTBODY]", emailBody);
            newsletterText = newsletterText.Replace("[SUBJECT]", assunto);
            //newsletterText = newsletterText.Replace("[EMAIL_INTROIMAGE]", "  <img style='width:280px;height:100px' src='http://teu site publico/" + lic_num + @"/logocustomer.png'  alt='Logo'  data-default='placeholder' /> ");
            //newsletterText = newsletterText.Replace("[EMAIL_RODAPEIMAGE]", "  <img style='width:200px;height:50px' src='http:// teu site publico /" + lic_num + @"/logocustomer.png'    alt='Logo'  data-default='placeholder' /> ");
            //newsletterText = newsletterText.Replace("[EMAIL_LICNAME]", lic_name);
            //newsletterText = newsletterText.Replace("[EMAIL_LICEMAIL]", lic_email);


            // ------------------------------------
            string _from = "geral@jpdado.pt";//getConfigurationField("email_user");
            string _emailpwd = "JPdado2018";// getConfigurationField("email_password");
            string _smtp = "mail.jpdado.pt";// getConfigurationField("email_smtp");
            string _smtpport = "465";// getConfigurationField("email_smtpport");  //  587

            mailMessage.From = new MailAddress(_from, "JPDADO - Serviços de Engenharia e Consultadoria, Lda");

            mailMessage.To.Add(emailTo);

            mailMessage.Subject = assunto;
            mailMessage.Body = newsletterText;
            mailMessage.IsBodyHtml = true;
            mailMessage.Priority = MailPriority.Normal;

            string html = "html";

            mailMessage.SubjectEncoding = System.Text.Encoding.UTF8;
            mailMessage.BodyEncoding = System.Text.Encoding.UTF8;

            System.Net.Mail.SmtpClient smtpClient = new System.Net.Mail.SmtpClient(_smtp);
            System.Net.NetworkCredential mailAuthentication = new System.Net.NetworkCredential(_from, _emailpwd);

            smtpClient.EnableSsl = false;
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = mailAuthentication;
            smtpClient.Timeout = 50000;
            smtpClient.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;

            smtpClient.Send(mailMessage);
            smtpClient.Dispose();

            newsletterText = string.Empty;
            newsletterText = File.ReadAllText(HttpContext.Current.Server.MapPath("~") + "\\templates\\template_email.html");

            emailBody = string.Empty;
            emailBody += "Agradecemos a sua mensagem! Tentaremos responder o mais brevemente possível. Obrigado!<br /><br />";
            emailBody += "Nome: " + nome + "<br />";
            emailBody += "Email: " + email + "<br />";
            emailBody += body.Replace("\n", "<br />") + "<br /><br />";
            emailBody += "Esta resposta é enviada automaticamente! Por favor, não responda a este email. Para qualquer contacto, utilize o nosso site. Obrigado!";
            newsletterText = newsletterText.Replace("[EMAIL_INTRO]", "Email de Contacto através do site www.jpdado.pt<br />" + assunto);
            newsletterText = newsletterText.Replace("[EMAIL_TEXTBODY]", emailBody);
            newsletterText = newsletterText.Replace("[SUBJECT]", assunto);

            mailMessage.From = new MailAddress(_from, "JPDADO - Serviços de Engenharia e Consultadoria, Lda");

            mailMessage.To.Add(email);

            mailMessage.Subject = assunto;
            mailMessage.Body = newsletterText;
            mailMessage.IsBodyHtml = true;
            mailMessage.Priority = MailPriority.Normal;

            mailMessage.SubjectEncoding = System.Text.Encoding.UTF8;
            mailMessage.BodyEncoding = System.Text.Encoding.UTF8;

            smtpClient = new System.Net.Mail.SmtpClient(_smtp);
            mailAuthentication = new System.Net.NetworkCredential(_from, _emailpwd);

            //smtpClient.Port = Convert.ToInt32(_smtpport);
            smtpClient.EnableSsl = false;
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = mailAuthentication;
            smtpClient.Timeout = 50000;
            smtpClient.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;

            smtpClient.Send(mailMessage);
            smtpClient.Dispose();
        }
        catch (Exception ex)
        {
            return ex.ToString();
        }

        return "0";
    }
}
