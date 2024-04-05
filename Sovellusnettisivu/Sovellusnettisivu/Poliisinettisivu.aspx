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

	            <input class="sijainti" type="submit" value="Mäntsälä, Levanto" />
	            <input class="sijainti" type="submit" value="Mäntsälä, Hakkari" />
	            <input class="sijainti" type="submit" value="Lahti, Lotila" />
	
	        <h2>Valtatie 12</h2>
	
	            <input class="sijainti" type="submit" value="Lahti, Hollola" />
	            <input class="sijainti" type="submit" value="Hämeenlinna, Hauho" />
	            <input class="sijainti" type="submit" value="Kangasala, Suorama" />
	
	        <h2>E75</h2>
	
	            <input class="sijainti" type="submit" value="Joutsa, Harvastensuo" />
	            <input class="sijainti" type="submit" value="Heinola, Lusi" />
	            <input class="sijainti" type="submit" value="Hartola" />
            </form>
                        <!-- Tästä painettaessa tieto hakeutuu valitun sijainnin perusteella, ja mittarit näyttävät sen -->
                </div>
            </div>
    
            <div class="box right">
                <div class="inner-box">
                <h2 align="left">Sijainti</h2>
				<p id="pvm"> 
                    <%
                      Response.Write(DateTime.Now.Date.ToShortDateString());
                    %> 
				</p>
				<p id="klo">
                    <%
                        Response.Write(DateTime.Now.ToString("HH:mm"));
                    %>
				</p>

                <!-- Matala = 500 autoa/h       -->
                <!-- Keksiverto = 1000 autoa/h  -->
                <!-- Korkea = 1500 autoa/h      -->
                <!-- Ruuhka > 2000 autoa/h      -->
                
                <div class="mittari">
                    <%
                        string mittarikuva;
                        Nappulafunktio1h();
                        Response.Write(tietohaku("23470"));
                    %> <!-- Tämän pitäisi muuttua sijaintia vaihtaessa-->
                </div>

                <img class="ruuhkamittari" src="materiaalit/<%Response.Write(mittarikuva);%>" alt="mittari"> <!-- Kuvan pitäisi vastata autojen määrää -->
                
                <div class="mittari">
                    <%
                        Nappulafunktio3h();
                    %> <!-- Tämän pitäisi muuttua sijaintia vaihtaessa-->
                </div>
                
                <div> <img class="ruuhkamittari"src="materiaalit/<%Response.Write(mittarikuva);%>" alt="mittari"></div> <!-- Kuvan pitäisi vastata autojen määrää -->

                <div class="mittari">
                    <%
                        Nappulafunktio1pv();
                    %> <!-- Tämän pitäisi muuttua sijaintia vaihtaessa-->
                </div>
                
                <div> <img class="ruuhkamittari"src="materiaalit/<%Response.Write(mittarikuva);%>" alt="mittari"></div> <!-- Kuvan pitäisi vastata autojen määrää -->
                </div>

              </div>
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
     int tietohaku(string x)
    {
        System.IO.StringWriter writer = new System.IO.StringWriter();
        System.Net.HttpWebRequest myRequest = (System.Net.HttpWebRequest)System.Net.WebRequest.Create($"http://tie.digitraffic.fi/api/tms/v1/stations/" + x + "/data");
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

    void Nappulafunktio1h()
    {
        mittarikuva = null;
        Random rnd = new Random();
        int num = rnd.Next(2001); // generoidaan fake dataa.
        Response.Write(num + " autoa / 1h");
        if (num >= 0 && num <= 500) {
            mittarikuva = "matala.svg";
        }
        else if (num >= 501 && num <= 1000) {
            mittarikuva = "keskiverto.svg";
        }
        else if (num >= 1001 && num <= 1500) {
            mittarikuva = "korkea.svg";
        }
        else if (num >= 1501 && num <= 2000) {
            mittarikuva = "ruuhka.svg";
        }
        else {
            mittarikuva = "korkea.svg";
        }

    }

    void Nappulafunktio3h()
    {
        Random rnd = new Random();
        int num2 = rnd.Next(1501); // generoidaan fake dataa.
        Response.Write(num2 * 3 + " autoa / 3h");
        if (num2 >= 0 && num2 <= 500) {
            mittarikuva = "matala.svg";
        }
        else if (num2 >= 501 && num2 <= 1000) {
            mittarikuva = "keskiverto.svg";
        }
        else if (num2 >= 1001 && num2 <= 1500) {
            mittarikuva = "korkea.svg";
        }
        else if (num2 >= 1501 && num2 <= 2000) {
            mittarikuva = "ruuhka.svg";
        }
        else {
            mittarikuva = "korkea.svg";
        }
    }

    void Nappulafunktio1pv()
    {
        Random rnd = new Random();
        int num3 = rnd.Next(1501); // generoidaan fake dataa.
        Response.Write(num3 * 24 + " autoa / 1pv");
        if (num3 >= 0 && num3 <= 500) {
            mittarikuva = "matala.svg";
        }
        else if (num3 >= 501 && num3 <= 1000) {
            mittarikuva = "keskiverto.svg";
        }
        else if (num3 >= 1001 && num3 <= 1500) {
            mittarikuva = "korkea.svg";
        }
        else if (num3 >= 1501 && num3 <= 2000) {
            mittarikuva = "ruuhka.svg";
        }
        else {
            mittarikuva = "korkea.svg";
        }
    }

%>
