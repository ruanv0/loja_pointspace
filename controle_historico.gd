extends Control


var titulo_original = {}
var nenhum_font_size_original: float
var margem_titulo_compras: float
var compra = load("res://compra.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	titulo_original["font_size"] = $titulo.get_theme_font_size("font_size")
	titulo_original["global_position"] = $titulo.global_position
	nenhum_font_size_original = $nenhum.get_theme_font_size("font_size")
	margem_titulo_compras = $compras.global_position.y - $titulo.global_position.y - $titulo.size.y
	carregar_compras()


func atualizar_interface() -> void:
	if get_viewport_rect().size.y / get_viewport_rect().size.x >= 1:
		global_position.y = 0
		var old_titulo_font_size = $titulo.get_theme_font_size("font_size")
		$titulo.add_theme_font_size_override("font_size", titulo_original["font_size"] * get_viewport_rect().size.x / 720)
		if old_titulo_font_size != $titulo.get_theme_font_size("font_size"):
			await($titulo.minimum_size_changed)
			$titulo.reset_size()
		$titulo.global_position.x = titulo_original["global_position"].x * get_viewport_rect().size.x / 720
		$titulo.global_position.y = titulo_original["global_position"].y * get_viewport_rect().size.x / 720
		$compras.global_position.y = $titulo.global_position.y + $titulo.size.y + margem_titulo_compras * get_viewport_rect().size.x / 720
		$nenhum.add_theme_font_size_override("font_size", nenhum_font_size_original * get_viewport_rect().size.x / 720)
		$nenhum.reset_size()
		$nenhum.global_position.x = (get_viewport_rect().size.x - $nenhum.size.x) / 2
		$nenhum.global_position.y = (get_viewport_rect().size.y - $nenhum.size.y) / 2
		for index in range(0, len($compras.get_children())):
			$compras.get_children()[index].atualizar_interface()
			$compras.get_children()[index].atualizar_global_position(20 * get_viewport_rect().size.x / 720,
																	 ($titulo.global_position.y + $titulo.size.y + 20 * get_viewport_rect().size.x / 720) + ($compras.get_children()[index].size.y + 20 * get_viewport_rect().size.x / 720) * index)
		if $compras.get_child_count() > 0:
			size.y = $compras.get_child(-1).global_position.y + $compras.get_child(-1).size.y - $titulo.global_position.y + 20 * get_viewport_rect().size.x / 720
	elif get_viewport_rect().size.x / get_viewport_rect().size.y > 1:
		global_position.y = 0
		var old_titulo_font_size = $titulo.get_theme_font_size("font_size")
		$titulo.add_theme_font_size_override("font_size", titulo_original["font_size"] * get_viewport_rect().size.x / 720)
		if old_titulo_font_size != $titulo.get_theme_font_size("font_size"):
			await($titulo.minimum_size_changed)
			$titulo.reset_size()
		$titulo.global_position.x = titulo_original["global_position"].x * get_viewport_rect().size.x / 720
		$titulo.global_position.y = titulo_original["global_position"].y * get_viewport_rect().size.x / 720
		$compras.global_position.y = $titulo.global_position.y + $titulo.size.y + margem_titulo_compras * get_viewport_rect().size.x / 720
		$nenhum.add_theme_font_size_override("font_size", nenhum_font_size_original * get_viewport_rect().size.x / 720)
		$nenhum.reset_size()
		$nenhum.global_position.x = (get_viewport_rect().size.x - $nenhum.size.x) / 2
		$nenhum.global_position.y = (get_viewport_rect().size.y - $nenhum.size.y) / 2
		for index in range(0, len($compras.get_children())):
			$compras.get_children()[index].atualizar_interface()
			$compras.get_children()[index].atualizar_global_position(20 * get_viewport_rect().size.x / 1280 + (($compras.get_children()[index].size.x + 20 * get_viewport_rect().size.x / 1280) * (index % 2)),
																	 ($titulo.global_position.y + $titulo.size.y + 20 * get_viewport_rect().size.x / 720) + ($compras.get_children()[index].size.y + 20 * get_viewport_rect().size.x / 720) * floori(index / 2.0))
		if $compras.get_child_count() > 0:
			size.y = $compras.get_child(-1).global_position.y + $compras.get_child(-1).size.y - $titulo.global_position.y + 20 * get_viewport_rect().size.x / 720


func carregar_compras() -> void:
	for compra_ in $compras.get_children():
		compra_.free()
	# Caso o usuário nãotenha feito nenhuma compra,
	# mostrar um texto de que não há nenhuma compra feita
	if len(user_info.historico_compras) == 0:
		$nenhum.visible = true
	else:
		$nenhum.visible = false
		# Para cada instância, colocar os seus detalhes corretamente
		for index_0 in range(0, len(user_info.historico_compras), 1):
			$compras.add_child(compra.instantiate())
			$compras.get_child(index_0).get_node("imagem").texture = load("res://imagens_produtos/" + user_info.historico_compras[index_0][4] + ".png")
			$compras.get_child(index_0).get_node("nome").text = "Nome: " + str(user_info.historico_compras[index_0][3])
			var preco_unidade_string = str(user_info.historico_compras[index_0][1])
			# Adicionar os espaços entre as unidades
			for index_1 in range(len(preco_unidade_string), 0, -3):
				preco_unidade_string = preco_unidade_string.insert(index_1, " ")
			$compras.get_child(index_0).get_node("preco_unidade").text = "Preço por unidade: R$ " + preco_unidade_string
			var unidades_string = str(user_info.historico_compras[index_0][2])
			# Adicionar os espaços entre as unidades
			for index_1 in range(len(unidades_string), 0, -3):
				unidades_string = unidades_string.insert(index_1, " ")
			$compras.get_child(index_0).get_node("unidades").text = "Unidades: " + unidades_string
			var preco_total_string = str(user_info.historico_compras[index_0][5])
			# Adicionar os espaços entre as unidades do preço
			for index_1 in range(len(preco_total_string), 0, -3):
				preco_total_string = preco_total_string.insert(index_1, " ")
			$compras.get_child(index_0).get_node("preco_total").text = "Preço total: R$ " + preco_total_string
			var quando = str(user_info.historico_compras[index_0][0])
			var quando_split_0 = quando.split("T")[0].split("-")
			var quando_split_1 = quando.split("T")[1].split(":")
			$compras.get_child(index_0).get_node("quando").text = "Quando: " + quando_split_0[2] + "/" + quando_split_0[1] + "/" + quando_split_0[0] + " " + quando_split_1[0] + ":" + quando_split_1[1]
	atualizar_interface()
