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
                
                        <%Random rnd = new Random();
      			int autojenlukumaara = rnd.Next(0, 1201); %>

		<form id="form1" runat="server" method="post" action="Poliisinettisivu.aspx">
    			<h2>Sijainti 1</h2>

			    <input class="sijainti" type="submit" value="Sijainti 1.1" </input>
			    <input class="sijainti" type="submit" value="Sijainti 1.2" </input>
			    <input class="sijainti" type="submit" value="Sijainti 1.3" </input>
	
			<h2>Sijainti 2</h2>
			
			    <input class="sijainti" type="submit" value="Sijainti 2.1" </input>
			    <input class="sijainti" type="submit" value="Sijainti 2.2" </input>
			    <input class="sijainti" type="submit" value="Sijainti 2.3" </input>
			
			<h2>Sijainti 3</h2>
			
			    <input class="sijainti" type="submit" value="Sijainti 2.1" </input>
			    <input class="sijainti" type="submit" value="Sijainti 2.2" </input>
			    <input class="sijainti" type="submit" value="Sijainti 2.3" </input>
                </div>
            </div>
    
            <div class="box right">
                <div class="inner-box">
                <h2 align="left">Sijainti</h2>
				<p id="pvm"> Päivämäärä </p>
				<p id="klo"> Kellonaika </p>

                <!-- Matala = 500 autoa/h       -->
                <!-- Keksiverto = 1000 autoa/h  -->
                <!-- Korkea = 1500 autoa/h      -->
                <!-- Ruuhka > 2000 autoa/h      -->
                
                <div class="mittari">
                    250 autoa / 1H <!-- Tämän pitäisi muuttua sijaintia vaihtaessa-->
                </div>

                <img class="ruuhkamittari" src="materiaalit/korkea.svg" alt="korkea"> <!-- Kuvan pitäisi vastata autojen määrää -->
                
                <div class="mittari">
                    602 autoa / 3H <!-- Tämän pitäisi muuttua sijaintia vaihtaessa-->
                </div>
                
                <div> <img class="ruuhkamittari"src="materiaalit/keskiverto.svg" alt="keskiverto"></div> <!-- Kuvan pitäisi vastata autojen määrää -->

                <div class="mittari">
                    2023 autoa / 1PV <!-- Tämän pitäisi muuttua sijaintia vaihtaessa-->
                </div>
                
                <div> <img class="ruuhkamittari"src="materiaalit/matala.svg" alt="matala"></div> <!-- Kuvan pitäisi vastata autojen määrää -->
                </div>

              </div>
           </div>
            
        
    </main>

    <footer>
        <p class="lfooter">
            Sovelluksen toteuttajan yhteystiedot sekä palaute lomakkeet linkki ja jeejee
            
        </p>
    
        <p class="rfooter">
            Tietoja haettu sivulta www.esimerkki.fi
        </p>
    </footer>
</body>
</html>
