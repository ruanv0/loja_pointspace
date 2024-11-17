extends Node


var enderecos = {}
var save_path = "user://save.json"
var reais: int
# Um inteiro que mostra o dinheiro em reais do usuário
var reais_string: String
# Uma string do dinheiro em reais com espaços entre as unidades
const margem = 40
var historico_compras = []


func save() -> void:
	# Salvar os dados em um arquivo .JSON
	var save_dict = {
		"enderecos": enderecos,
		"reais": reais,
		"historico_compras": historico_compras
	}
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	var json_string = JSON.stringify(save_dict)
	file.store_line(json_string)
	


func load_data() -> void:
	# Carregar os arquivos de um arquivo .JSON
	var file = FileAccess.open(save_path, FileAccess.READ)
	while file.get_position() < file.get_length():
		var json_string = file.get_line()
		var json = JSON.new()
		json.parse(json_string)
		var node_data = json.get_data()
		enderecos = node_data["enderecos"]
		reais = int(node_data["reais"])
		historico_compras = node_data["historico_compras"]


func editar_dinheiro(dinheiro: int) -> void:
	# Adicionar ou remover dinheiro dos dados do usuário
	reais = dinheiro
	reais_string = str(reais)
	for i in range(len(reais_string), 0, -3):
		reais_string = reais_string.insert(i, " ")
	# Após isso salvar os dados do usuário
	save()


func adicionar_historico(preco_unidade: int, unidades: int, nome: String, codinome: String) -> void:
	# Adicionar ao histórico de compras as compras com a data e hora do dispositivo,
	# preço por unidade, quantas unidades, o nome do produto e o codinome
	# do produto usado nos arquivos
	historico_compras.append([Time.get_datetime_string_from_system(), preco_unidade,
							 unidades, nome, codinome, unidades * preco_unidade])


func gastar_dinheiro(preco_unidade: int, unidades: int, nome: String, codinome: String) -> void:
	# Acrecentar aos dados do usuário o dinheiro gasto e o produto comprado
	if preco_unidade * unidades <= reais:
		adicionar_historico(preco_unidade, unidades, nome, codinome)
		editar_dinheiro(reais - preco_unidade * unidades)
		$"../controle".atualizar_dinheiro()
		# Após isso salvar os dados do usuário
		save()
	elif preco_unidade * unidades > reais:
		# Caso o gasto seja maior que o dinheiro do usuário, mostrar um erro
		$"../controle".erro(0)


func _ready() -> void:
	if not FileAccess.file_exists(save_path):
		# Caso o usuário entre no programa pela primeira vez e
		# não haja um arquivo .JSON sobre ele
		reais = RandomNumberGenerator.new().randi_range(6000000, 9000000)
		save()
	else:
		load_data()
	# Uma string do dinheiro em reais com espaços entre as unidades
	reais_string = str(user_info.reais)
	for index in range(len(reais_string), 0, -3):
		reais_string = reais_string.insert(index, " ")
