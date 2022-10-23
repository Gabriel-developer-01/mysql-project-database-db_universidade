# %%
import matplotlib.pyplot as grafico
import pyodbc

def retornar_conexao_sql():
    server = "localhost"
    database = "db_pesquisa_universidade"
    username = "root"
    password = "3245"
    dados_conexao = 'DRIVER={MySQL ODBC 8.0 ANSI Driver};SERVER='+server+';DATABASE='+database+';UID='+username+';PASSWORD='+password
    conexao = pyodbc.connect(dados_conexao)
    return conexao.cursor()

cursor = retornar_conexao_sql()

salario = []
ano = []

for row in cursor.execute("""SELECT * FROM V_BUSCAR_MEDIA_SALARIAL_POR_ANO""") :
    salario.append(str(row[0]))
    ano.append(int(row[1]))

cursor.close()

grafico.ylabel('Salário')
grafico.xlabel('Ano', color='blue')
grafico.title('Gráfico de salário por ano')
grafico.bar(ano, salario)
grafico.show()
# %%
