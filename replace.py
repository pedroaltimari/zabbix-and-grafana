# G R A F A N A

# Script que utilizei para substituir o nome de um host para outro host do mesmo host group com os mesmos itens utilizados.
# No caso exportei o JSON Model do Grafana, colei em um .txt e executei o script com nome do host antigo para o nome do host novo.
# Depois importei o arquivo no Grafana e funcionou perfeitamente. :)

# Obs: isso pode ser feito de item to item, item tag to item tag, host group to host group etc.

nome_arquivo_entrada = 'test.txt' # Arquivo
nome_arquivo_saida = 'new-test.txt' # Arquivo que será criado
palavra_antiga = 'RA-SW-L2-03' # Palavra que será removida
palavra_nova = 'RA-SW-L2-02' # Palavra que será adicionada

with open(nome_arquivo_entrada, 'r') as arquivo_entrada:
    conteudo = arquivo_entrada.read()

conteudo_modificado = conteudo.replace(palavra_antiga, palavra_nova)

with open(nome_arquivo_saida, 'w') as arquivo_saida:
    arquivo_saida.write(conteudo_modificado)

print(f'A substituição de "{palavra_antiga}" por "{palavra_nova}" foi concluída e salva em "{nome_arquivo_saida}".')
 
