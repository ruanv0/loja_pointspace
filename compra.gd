extends Panel


var fundo_original_size: Vector2
var imagem_original_position: Vector2
var nome_original = {}
var preco_unidade_original = {}
var unidades_original = {}
var preco_total_original = {}
var quando_original = {}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fundo_original_size = size
	imagem_original_position = $imagem.position
	nome_original["font_size"] = $nome.get_theme_font_size("font_size")
	nome_original["position"] = $nome.position
	preco_unidade_original["font_size"] = $preco_unidade.get_theme_font_size("font_size")
	preco_unidade_original["position"] = $preco_unidade.position
	unidades_original["font_size"] = $unidades.get_theme_font_size("font_size")
	unidades_original["position"] = $unidades.position
	preco_total_original["font_size"] = $preco_total.get_theme_font_size("font_size")
	preco_total_original["position"] = $preco_total.position
	quando_original["font_size"] = $quando.get_theme_font_size("font_size")
	quando_original["position"] = $quando.position
	atualizar_interface()


func atualizar_global_position(x: float, y: float) -> void:
	global_position.x = x
	global_position.y = y


func atualizar_interface() -> void:
	if get_viewport_rect().size.y / get_viewport_rect().size.x >= 1:
		size.x = fundo_original_size.x * get_viewport_rect().size.x / 720
		size.y = fundo_original_size.y * get_viewport_rect().size.x / 720
		$imagem.scale = Vector2(get_viewport_rect().size.x / 720,
														get_viewport_rect().size.x / 720)
		$imagem.position.x = imagem_original_position.x * get_viewport_rect().size.x / 720
		$imagem.position.y = imagem_original_position.y * get_viewport_rect().size.x / 720
		$nome.add_theme_font_size_override("font_size", nome_original["font_size"] * get_viewport_rect().size.x / 720)
		$nome.reset_size()
		$nome.position.x = nome_original["position"].x * get_viewport_rect().size.x / 720
		$nome.position.y = nome_original["position"].y * get_viewport_rect().size.x / 720
		$preco_unidade.add_theme_font_size_override("font_size", preco_unidade_original["font_size"] * get_viewport_rect().size.x / 720)
		$preco_unidade.reset_size()
		$preco_unidade.position.x = preco_unidade_original["position"].x * get_viewport_rect().size.x / 720
		$preco_unidade.position.y = preco_unidade_original["position"].y * get_viewport_rect().size.x / 720
		$unidades.add_theme_font_size_override("font_size", unidades_original["font_size"] * get_viewport_rect().size.x / 720)
		$unidades.reset_size()
		$unidades.position.x = unidades_original["position"].x * get_viewport_rect().size.x / 720
		$unidades.position.y = unidades_original["position"].y * get_viewport_rect().size.x / 720
		$preco_total.add_theme_font_size_override("font_size", preco_total_original["font_size"] * get_viewport_rect().size.x / 720)
		$preco_total.reset_size()
		$preco_total.position.x = preco_total_original["position"].x * get_viewport_rect().size.x / 720
		$preco_total.position.y = preco_total_original["position"].y * get_viewport_rect().size.x / 720
		$quando.add_theme_font_size_override("font_size", quando_original["font_size"] * get_viewport_rect().size.x / 720)
		$quando.reset_size()
		$quando.position.x = quando_original["position"].x * get_viewport_rect().size.x / 720
		$quando.position.y = quando_original["position"].y * get_viewport_rect().size.x / 720
	elif get_viewport_rect().size.x / get_viewport_rect().size.y >= 1:
		size.x = fundo_original_size.x * get_viewport_rect().size.x / 720 / 2
		size.y = fundo_original_size.y * get_viewport_rect().size.x / 720 / 2
		$imagem.scale = Vector2(get_viewport_rect().size.x / 720 / 2,
														get_viewport_rect().size.x / 720 / 2)
		$imagem.position.x = imagem_original_position.x * get_viewport_rect().size.x / 720 / 2
		$imagem.position.y = imagem_original_position.y * get_viewport_rect().size.x / 720 / 2
		$nome.add_theme_font_size_override("font_size", nome_original["font_size"] * get_viewport_rect().size.x / 720 / 2)
		$nome.reset_size()
		$nome.position.x = nome_original["position"].x * get_viewport_rect().size.x / 720 / 2
		$nome.position.y = nome_original["position"].y * get_viewport_rect().size.x / 720 / 2
		$preco_unidade.add_theme_font_size_override("font_size", preco_unidade_original["font_size"] * get_viewport_rect().size.x / 720 / 2)
		$preco_unidade.reset_size()
		$preco_unidade.position.x = preco_unidade_original["position"].x * get_viewport_rect().size.x / 720 / 2
		$preco_unidade.position.y = preco_unidade_original["position"].y * get_viewport_rect().size.x / 720 / 2
		$unidades.add_theme_font_size_override("font_size", unidades_original["font_size"] * get_viewport_rect().size.x / 720 / 2)
		$unidades.reset_size()
		$unidades.position.x = unidades_original["position"].x * get_viewport_rect().size.x / 720 / 2
		$unidades.position.y = unidades_original["position"].y * get_viewport_rect().size.x / 720 / 2
		$preco_total.add_theme_font_size_override("font_size", preco_total_original["font_size"] * get_viewport_rect().size.x / 720 / 2)
		$preco_total.reset_size()
		$preco_total.position.x = preco_total_original["position"].x * get_viewport_rect().size.x / 720 / 2
		$preco_total.position.y = preco_total_original["position"].y * get_viewport_rect().size.x / 720 / 2
		$quando.add_theme_font_size_override("font_size", quando_original["font_size"] * get_viewport_rect().size.x / 720 / 2)
		$quando.reset_size()
		$quando.position.x = quando_original["position"].x * get_viewport_rect().size.x / 720 / 2
		$quando.position.y = quando_original["position"].y * get_viewport_rect().size.x / 720 / 2
