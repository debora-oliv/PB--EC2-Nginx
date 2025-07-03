#!/bin/bash

apt-get update -y
apt-get upgrade -y

apt-get install nginx -y
systemctl start nginx

systemctl enable nginx

cat > /var/www/html/index.html <<'EOF'
<!DOCTYPE html>
<html lang="pt-br">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>PB Compass</title>
	<link rel="stylesheet" href="style.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
	<header>
		<nav>
			<ul class="cabecalho">
				<li>
					<a class="cabecalho_texto" href="#sobre">Sobre o projeto</a>
                		</li>
                		<li>
                    			<a class="cabecalho_texto" href="#tecnologias">Tecnologias</a>
                		</li>
                		<li>
					<a class="cabecalho_texto" href="#documentacao">Documentação</a>
				</li>
			</ul>
		</nav>
	</header>
	<main class="main">
		<section id="sobre" class="home_apresentacao">
			<h1 class="home_apresentacao_titulo">
                		Sobre o projeto
			</h1>
            		<p class="home_apresentacao_p">
                O objetivo do projeto foi desenvolver e testar habilidades em <strong class="home_apresentacao_titulo_destaque">Linux, AWS e automação de processos</strong> através da configuração de um ambiente de <strong class="home_apresentacao_titulo_destaque">servidor web monitorado.</strong>
            		</p>
            		<p class="home_apresentacao_p">
                O passo inicial do projeto foi a configuração do ambiente. Configurei uma VPC com 2 sub-redes públicas e 2 privadas. Na sub-rede pública criei uma instância EC2 com Sistema Operacional Ubuntu. Subi um servidor Nginx e desenvolvi um script que verifica a cada 1 minuto se o site está disponível, caso a aplicação não esteja funcionando, o script envia uma notificação via Discord.
            		</p>
		</section>
        
		<section id="tecnologias" class="home_apresentacao">
			<h1 class="home_apresentacao_titulo">
                		Tecnologias e ferramentas
            		</h1>
            
            		<ul class="lista-tecnologias">                
                		<li class="tecnologia-item">
                    			<i class="fab fa-aws"></i>
                    			<span>EC2</span>
                		</li>
                		<li class="tecnologia-item">
                    			<i class="fas fa-network-wired"></i>
                    			<span>VPC</span>
                		</li>
                		<li class="tecnologia-item">
                    			<i class="fas fa-server"></i>
                    			<span>NGINX</span>
                		</li>
                		<li class="tecnologia-item">
                    			<i class="fas fa-terminal"></i>
                    			<span>BASH</span>
                		</li>
                		<li class="tecnologia-item">
                    			<i class="fab fa-discord"></i>
                    			<span>DISCORD WEBHOOK</span>
                		</li>
            		</ul>
        	</section>
        	<section id="documentacao" class="home_apresentacao">
            		<h1 class="home_apresentacao_titulo">
                		Documentação
            		</h1>
            		<div class="documentacao-container">
                		<p class="home_apresentacao_p documentacao-texto">
                    			A documentação detalhada do projeto está disponível com todos os passos de implementação, configurações técnicas e códigos utilizados. Explore para entender melhor a arquitetura e o funcionamento do sistema.
                		</p>
                		<div class="botao-documentacao">
                    			<a href="documentacao.html" class="botao">
                        			<i class="fas fa-book"></i> Acessar
                    			</a>
                		</div>
            		</div>
        	</section>
	</main>
    
	<footer class="rodape-container">
        	<ul class="rodape">
            		<li>
                		<a class="rodape_texto" href="https://www.linkedin.com/in/debora-oliv-alves/" target="_blank">
                    			<i class="fab fa-linkedin"></i> Linkedin
               	 		</a>
            		</li>
            		<li>
                		<a class="rodape_texto" href="https://github.com/debora-oliv" target="_blank">
                    			<i class="fab fa-github"></i> Github
                		</a>
            		</li>
            		<li>
                		<a class="rodape_texto" href="https://www.instagram.com/alves.debster/" target="_blank">
                    			<i class="fab fa-instagram"></i> Instagram
                		</a>
            		</li>
        	</ul>
	</footer>
</body>
</html>
EOF

cat > /var/www/html/style.css <<'EOF'
@import url('https://fonts.googleapis.com/css2?family=Krona+One&family=Montserrat:wght@400;600&display=swap');

:root {
	--cor-primaria: #17161b;
	--cor-secundaria: #cbcddb;
	--cor-terciaria: #ce6c10;
	--cor-hover: #111116;
	--fonte-primaria: 'Krona One', sans-serif;
	--fonte-secundaria: 'Montserrat', sans-serif;
}

* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

body {
	background-color: var(--cor-primaria);
	color: var(--cor-secundaria);
	line-height: 1.6;
}

.main {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	padding: 5% 10%;
	gap: 60px;
}

.home_apresentacao {
	width: 100%;
	display: flex;
	flex-direction: column;
	gap: 30px;
}

.home_apresentacao_titulo {
	font-family: var(--fonte-primaria);
	font-size: 2.25rem;
	font-weight: 600;
	margin-bottom: 20px;
}

.home_apresentacao_titulo_destaque {
	color: var(--cor-terciaria);
}

.home_apresentacao_p {
	font-family: var(--fonte-secundaria);
	font-size: 1.25rem;
	text-align: justify;
}

.botao-documentacao {
	display: flex;
	justify-content: center;
}

.botao {
	background-color: var(--cor-terciaria);
	color: var(--cor-secundaria);
	padding: 30px 100px;
	text-decoration: none;
	font-family: var(--fonte-secundaria);
	font-weight: 600;
	font-size: 1.125rem;
	border-radius: 8px;
	transition: all 0.3s ease;
	display: flex;
	align-items: center;
	gap: 10px;
}

.botao:hover {
	transform: scale(1.05);
}

.documentacao-container {
	display: flex;
	align-items: center;
	gap: 40px;
}

.botao-documentacao {
	margin-top: 0;
	flex-shrink: 0;
}

.lista-tecnologias {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	gap: 40px;
	margin-top: 40px;
	list-style-type: none;
}

.tecnologia-item {
	background-color: var(--cor-hover);
	padding: 20px 30px;
	border-radius: 8px;
	display: flex;
	align-items: center;
	gap: 15px;
	font-family: var(--fonte-secundaria);
	font-size: 1.125rem;
	transition: all 0.3s ease;
	min-width: 200px;
	justify-content: center;
}

.tecnologia-item:hover {
	transform: translateY(-5px);
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
}

.tecnologia-item i {
	font-size: 1.5rem;
	color: var(--cor-terciaria);
}

.cabecalho {
    margin: 3% 7%;
    display: flex;
    justify-content: flex-start;
    list-style-type: none;
    gap: 90px;
}

.cabecalho_texto {
	text-decoration: none;
	font-family: var(--fonte-secundaria);
	color: var(--cor-secundaria);
	font-size: 1.25rem;
	font-weight: 600;
	position: relative;
	padding-bottom: 5px;
}

.cabecalho_texto:hover {
	color: var(--cor-terciaria);
}

.cabecalho_texto::after {
	content: '';
	position: absolute;
	width: 0;
	height: 2px;
	bottom: 0;
	left: 0;
	background-color: var(--cor-terciaria);
	transition: width 0.3s ease;
}

.cabecalho_texto:hover::after {
	width: 100%;
}

.rodape-container {
	background-color: var(--cor-hover);
	padding: 30px;
	text-align: center;
}

.rodape {
	display: flex;
	justify-content: center;
	list-style-type: none;
	gap: 70px;
	margin-bottom: 20px;
}

.rodape_texto {
	text-decoration: none;
	font-family: var(--fonte-secundaria);
	color: var(--cor-secundaria);
	font-size: 1.125rem;
	font-weight: 500;
	display: flex;
	align-items: center;
	gap: 8px;
}

.rodape_texto:hover {
	color: var(--cor-terciaria);
}

@media (max-width: 768px) {
    .cabecalho {
        flex-direction: column;
        gap: 20px;
        align-items: center;
    }
    
    .lista-tecnologias {
        flex-direction: column;
        align-items: center;
    }
    
    .rodape {
        flex-direction: column;
        gap: 20px;
    }
    
    .home_apresentacao_titulo {
        font-size: 1.75rem;
    }
    
    .home_apresentacao_p {
        font-size: 1rem;
    }

    .documentacao-container {
        flex-direction: column;
        align-items: flex-start;
        gap: 20px;
    }
    
    .botao {
        width: 100%;
        justify-content: center;
    }
}
EOF

chown -R www-data:www-data /var/www/html
chmod -R 750 /var/www/html

cat > /usr/local/bin/nginx_monitoramento.sh <<'EOF'
#!/bin/bash

NGINX_URL="http://localhost"
DISCORD_WEBHOOK="https://discord.com/api/webhooks/1387634407803719774/NsnLifYKD1LZtKUrfv2JRv6cIN6-1vWTvqZjhrOCst4qO3wTe0B_dhhGRtdCL6Yn8U3V"
LOG_DIR="/var/log/"
LOG_FILE="$LOG_DIR/nginx-monitoramento.log"
ORIGEM="EC2"

mkdir -p "$LOG_DIR"

if curl -s -I "$NGINX_URL" | grep -q "200 OK"; then
	echo "[$ORIGEM] Servidor Nginx ONLINE - $(date '+%d/%m %H:%M')" >> "$LOG_FILE"
else
    	STATUS="[$ORIGEM] Servidor Nginx OFFLINE - $(date '+%d/%m %H:%M')"
	echo "$STATUS" >> "$LOG_FILE"
fi

echo "$STATUS" >> "$LOG_FILE"

curl -sS -H "Content-Type: application/json" -X POST \
    	-d "{\"content\":\"$STATUS\"}" "$DISCORD_WEBHOOK" \
    	|| echo "[ERRO] Falha ao enviar para Discord - $(date '+%d/%m %H:%M')" >> "$LOG_FILE"
EOF

chmod +x /usr/local/bin/nginx_monitoramento.sh

cat > /etc/systemd/system/nginx-monitoramento.service <<'EOF'
[Unit]
Description=Monitoramento do Servidor Nginx
After=nginx.service

[Service]
Type=simple
ExecStart=/usr/local/bin/nginx_monitoramento.sh
Restart=always
RestartSec=30
User=root

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl start nginx-monitoramento
systemctl enable nginx-monitoramento

systemctl restart nginx