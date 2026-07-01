# Banco de dados de Notas
banco_notas = String[]

function adicionar_nota(nota::String)
    push!(banco_notas, nota)
    return "[Servidor] Nota armazenada com sucesso!"
end

function exibir_notas()
    println("[Servidor] Exibindo todas as notas armazenadas:")
    if isempty(banco_notas)
        println("[Vazio] Nenhuma nota armazenada ainda!")
    else
        for (index, nota) in enumerate(banco_notas)
            println("Nota $(index): $nota")
        end

    end

end

# Filtro Proxy
function proxy_bloco_notas(texto::String)
    
    # Lista Negra.
    lista_negra = ["ataque", "malicioso", "spam", "invasão", "phishing", "exploit", "malware", "ransomware", "trojan", "keylogger", "sexo", "violência", "racismo", "discriminação", "terrorismo", "assédio", "bullying", "pornografia", "conteúdo impróprio", "sexo anal", "sexo oral", "sexo vaginal", "sexo explícito", "sexo explícito com menores", "sexo explícito com animais", "conteúdo sexual", "conteúdo violento", "conteúdo discriminatório", "conteúdo de ódio", "conteúdo de assédio", "conteúdo de bullying", "conteúdo de pornografia", "conteúdo impróprio para menores", "pornografia infantil", "abuso sexual", "assédio sexual", "violência doméstica", "violência sexual", "discriminação racial", "discriminação de gênero", "discriminação religiosa", "discriminação sexual", "discriminação de orientação sexual", "discriminação de identidade de gênero", "discriminação de deficiência", "discriminação de idade", "discriminação de nacionalidade", "discriminação de etnia", "discriminação de classe social", "discriminação de aparência física", "discriminação de peso", "discriminação de altura", "discriminação de cor da pele", "discriminação de cabelo", "discriminação de estilo de vida", "discriminação de hobbies", "discriminação de interesses pessoais", "antisemitismo", "islamofobia", "homofobia", "transfobia", "xenofobia", "discriminação de idioma", "discriminação de sotaque", "discriminação de região geográfica", "discriminação de cidade", "discriminação de bairro", "discriminação de país", "discriminação de continente", "discriminação de planeta", "discriminação de universo", "nazismo", "fascismo", "comunismo", "socialismo", "capitalismo", "liberalismo", "conservadorismo", "progressismo", "anarquismo", "totalitarismo", "autoritarismo", "democracia", "ditadura", "monarquia", "república", "teocracia", "oligarquia", "plutocracia", "meritocracia", "elitismo", "populismo", "nacionalismo", "internacionalismo", "globalização", "localização"]  

    texto_minúsculo = lowercase(texto)

    for palavra in lista_negra
        if occursin(palavra, texto_minúsculo)
         println("\n ALERTA DE SEGURANÇA: Comportamento suspeito detectado! A nota contém a palavra proibida: '$palavra'.")
         println("Tux está muito triste com você! Então ele vai fechar seu sistema, babaca! >:)")
         sleep(1)

         # Scream
            println("\nSegmentation fault (core dumped)")
            exit(1)
        end
    end

    return adicionar_nota(texto)
end     

# Interface do Usuário
while true
      println("[1] Ver todas suas notas armazenadas.")
        println("[0] Sair do sistema.")
        print("Sua ação: ")

        entrada = readline()

            if entrada == "1"
                exibir_notas()
            elseif entrada == "0"
                println("[Proxy] Saindo do sistema. Até mais!")
                break
            else
                # Nota nova caso nem Zero nem um seja digitado.
                println("\n[Usu[ario] Enviando sua nota para o Proxy...")
                resposta = proxy_bloco_notas(entrada)
                println(resposta)
                end
                
            end