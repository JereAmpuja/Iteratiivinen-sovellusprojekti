<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Poliisinettisivu.aspx.cs" Inherits="Sovellusnettisivu.Poliisinettisivu" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nettisivu</title>
    <link rel="stylesheet" href="mainpage.css" />
</head>


<body>
    <header>
        <a href src="Nettisivu.html"> <img id="headerlogo" src="materiaalit/poliisi.png" /> </a>
        <h1 id="headerteksti">POLIISIN LIIKENNETILA SOVELLUS</h1>
    </header>

    <main>
        <div class="container">
            <div class="box left">

                <div class="inner-box">
                
                    <form id="form1" runat="server" method="post" action="Poliisinettisivu.aspx">
  			        <h2>Valtatie 4</h2>

	            <input name="location" class="sijainti" type="submit" value="Mäntsälä, Levanto" />
	            <input name="location" class="sijainti" type="submit" value="Mäntsälä, Hakkari" />
	            <input name="location" class="sijainti" type="submit" value="Lahti, Lotila" />
	
	        <h2>Valtatie 12</h2>
	
	            <input name="location" class="sijainti" type="submit" value="Lahti, Hollola" />
	            <input name="location" class="sijainti" type="submit" value="Hämeenlinna, Hauho" />
	            <input name="location" class="sijainti" type="submit" value="Kangasala, Suorama" />
	
	        <h2>E75</h2>
	
		    <input name="location" class="sijainti" type="submit" value="Joutsa, Harvastensuo" />
			<input name="location" class="sijainti" type="submit" value="Heinola, Lusi" />
			<input name="location" class="sijainti" type="submit" value="Hartola" />

            </form>

                </div>
            </div>
    
            <div class="box right">     
                <%
                    if (Request.Form["location"] == null){
                        Response.Write(etusivuoikeaboxi());
                    }
                    if (Request.Form["location"] != null){
                        Response.Write(oikeaboxi());
                    }
                %>
           </div>
            
        
    </main>

    <footer>
        <p class="lfooter">
            Palaute: jörnijät@gmail.com
            
        </p>
    
        <p class="rfooter">
            Tietoja haettu sivulta www.esimerkki.fi
        </p>
    </footer>
</body>
</html>

<% 
     string etusivuoikeaboxi()
        {
        string etusivu =@"
                        <p id=""pvm2"">" + DateTime.Now.Date.ToShortDateString() + @"</p>
                        <p id=""klo2"">" + DateTime.Now.ToString("HH:mm") + @"</p>
                        <div id=""txt"">
                        <h1>Valitse mittauspiste</h1> 
                        </div>
                        ";      
        return etusivu;
        }

     string oikeaboxi()
    {
 
        string htmlCode = @"
            <div class=""inner-box"">
                <h2 align=""left"">" + lokaatio() + @"</h2>
                <p id=""pvm"">" + DateTime.Now.Date.ToShortDateString() + @"</p>
                <p id=""klo"">" + DateTime.Now.ToString("HH:mm") + @"</p>
                <div class=""mittari"">" + valinta() + @" / 1H</div>
                <img class=""ruuhkamittari"" src=""materiaalit/" + ruuhkamittari() + @""" alt=""mittari"">
                <div class=""mittari"">" + valinta() * 3 + @" / 3H</div>
                <div> <img class=""ruuhkamittari""src=""materiaalit/" + ruuhkamittari() + @""" alt=""mittari""></div>
                <div class=""mittari"">" + valinta() * 5 + @" / 5H</div>
                <div> <img class=""ruuhkamittari""src=""materiaalit/" + ruuhkamittari() + @""" alt=""mittari""></div>
            </div>";

        return htmlCode;
    }

    string ruuhkamittari()
    {
        string mittarikuva = null;
        if (valinta() >= 0 && valinta() <= 500) {
            mittarikuva = "matala.svg";
        }
        else if (valinta() >= 501 && valinta() <= 1000) {
            mittarikuva = "keskiverto.svg";
        }
        else if (valinta() >= 1001 && valinta() <= 1500) {
            mittarikuva = "korkea.svg";
        }
        else if (valinta() >= 1501 && valinta() <= 2000) {
            mittarikuva = "ruuhka.svg";
        }
        else {
            mittarikuva = "korkea.svg";
        }

        return mittarikuva;
    }

    int valinta()
    {

        if (Request.Form["location"] != null)
        {
            string location = Request.Form["location"];

            if (location == "Mäntsälä, Levanto")
            {
                return tietohaku("23142");
            }
            else if (location == "Mäntsälä, Hakkari")
            {
                return tietohaku("23110");
            }
            else if (location == "Lahti, Lotila")
            {
                return tietohaku("23470");
            }
            else if (location == "Lahti, Hollola")
            {
                return tietohaku("23407");
            }
            else if (location == "Hämeenlinna, Hauho")
            {
                return tietohaku("23426");
            }
            else if (location == "Kangasala, Suorama")
            {
                return tietohaku("23431");
            }
            else if (location == "Joutsa, Harvastensuo")
            {
                return tietohaku("23928");
            }
            else if (location == "Heinola, Lusi")
            {
                return tietohaku("23442");
            }
            else if (location == "Hartola")
            {
                return tietohaku("23623");
            }
            else
            {
                return 0;
            }
        }
        else    {
            return 0;
        }
    }


    string lokaatio()
{

    if (Request.Form["location"] != null)
    {
        string location = Request.Form["location"];

        if (location == "Mäntsälä, Levanto")
        {
            return "Mäntsälä, Levanto";
        }
        else if (location == "Mäntsälä, Hakkari")
        {
            return "Mäntsälä, Hakkari";
        }
        else if (location == "Lahti, Lotila")
        {
            return "Lahti, Lotila";
        }
        else if (location == "Lahti, Hollola")
        {
            return "Lahti, Hollola";    
        }
        else if (location == "Hämeenlinna, Hauho")
        {
            return "Hämeenlinna, Hauho";
        }
        else if (location == "Kangasala, Suorama")
        {
            return "Kangasala, Suorama";
        }
        else if (location == "Joutsa, Harvastensuo")
        {
            return "Joutsa, Harvastensuo" ;
        }
        else if (location == "Heinola, Lusi")
        {
            return "Heinola, Lusi";
        }
        else if (location == "Hartola")
        {
            return "Hartola";
        }

        else
        {
            return "Valitse mittauspiste";
        }
    }
    else
    {
        return "Valitse mittauspiste";
    }
}

    int tietohaku(string x)
    {
        System.IO.StringWriter writer = new System.IO.StringWriter();
        System.Net.HttpWebRequest myRequest = (System.Net.HttpWebRequest)System.Net.WebRequest.Create(@"http://tie.digitraffic.fi/api/tms/v1/stations/" + x + @"/data");
        myRequest.AutomaticDecompression = System.Net.DecompressionMethods.GZip | System.Net.DecompressionMethods.Deflate;
        System.Net.WebResponse response = myRequest.GetResponse();

        char[] määrä = new char[4];

        System.IO.Stream dataStream = response.GetResponseStream();

        System.IO.StreamReader reader = new System.IO.StreamReader(dataStream);

        string responseFromServer = reader.ReadToEnd();
        int valueposition = responseFromServer.IndexOf(@"value");
        responseFromServer.CopyTo(valueposition + 8, määrä, 0, määrä.Length);

        string palautus = "";
        for (int i = 0; i < määrä.Length; i++)
        {
            palautus += määrä[i];
        }

        int palautus1 = Convert.ToInt32(palautus);

        return palautus1;

    }

%>
