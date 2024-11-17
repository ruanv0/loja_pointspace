extends Control


var size_y: float
var texto_dinheiro_original = {}
var nome_font_size_original: float
var autor_font_size_original: float
var preco_font_size_original: float
var escrita_original = {}
var unidades_font_size_original: float
var comprar_original = {}
var sobre_original_font_size = {}
var autor: String


func _ready() -> void:
	$dinheiro.text = "Dinheiro: R$ " + user_info.reais_string
	texto_dinheiro_original["font_size"] = $dinheiro.get_theme_font_size("font_size")
	texto_dinheiro_original["global_position"] = $dinheiro.global_position
	nome_font_size_original = $nome.get_theme_font_size("font_size")
	autor_font_size_original = $autor.get_theme_font_size("font_size")
	preco_font_size_original = $preco.get_theme_font_size("font_size")
	escrita_original["position"] = $unidades/escrita.position
	escrita_original["font_size"] = $unidades/escrita.get_theme_font_size("font_size")
	unidades_font_size_original = $unidades.get_theme_font_size("font_size")
	comprar_original["fundo_size"] = $comprar.size
	comprar_original["texto_font_size"] = $comprar/texto.get_theme_font_size("font_size")
	comprar_original["texto_position"] = $comprar/texto.position
	sobre_original_font_size = $sobre.get_theme_font_size("normal_font_size")


func atualizar_dados(preco_por_unidade: int, unidades: int, nome: String, codinome: String, autor_: String, sobre: String) -> void:
	$imagem.texture = load("res://imagens_produtos/" + codinome + ".png")
	$nome.text = nome
	$autor.text = autor_
	autor = autor_
	var preco_string = str(preco_por_unidade)
	for index in range(len(preco_string), 0, -3):
		preco_string = preco_string.insert(index, " ")
	$preco.text = "R$ " + str(preco_string)
	$unidades/escrita.text = str(unidades)
	$sobre.text = sobre
	atualizar_interface()


func atualizar_interface() -> void:
	if get_viewport_rect().size.y / get_viewport_rect().size.x >= 1:
		$dinheiro.global_position.x = texto_dinheiro_original["global_position"].x * get_viewport_rect().size.x / 720
		$dinheiro.global_position.y = texto_dinheiro_original["global_position"].y * get_viewport_rect().size.x / 720
		$dinheiro.add_theme_font_size_override("font_size", texto_dinheiro_original["font_size"] * get_viewport_rect().size.x / 720)
		$dinheiro.reset_size()
		$imagem.scale = Vector2(get_viewport_rect().size.x / 720, get_viewport_rect().size.x / 720)
		$imagem.global_position.y = $dinheiro.global_position.y + $dinheiro.size.y + 20 * get_viewport_rect().size.x / 720
		$nome.global_position.x = $dinheiro.global_position.x
		$nome.global_position.y = $imagem.global_position.y + $imagem.size.y * $imagem.scale.y + 20
		$nome.add_theme_font_size_override("font_size", nome_font_size_original * get_viewport_rect().size.x / 720)
		$nome.reset_size()
		$autor.global_position.x = $dinheiro.global_position.x
		$autor.global_position.y = $nome.global_position.y + $nome.size.y + 20 * get_viewport_rect().size.x / 720
		$autor.add_theme_font_size_override("font_size", autor_font_size_original * get_viewport_rect().size.x / 720)
		$autor.reset_size()
		$preco.global_position.x = $dinheiro.global_position.x
		$preco.global_position.y = $autor.global_position.y + $autor.size.y + 20 * get_viewport_rect().size.x / 720
		$preco.add_theme_font_size_override("font_size", preco_font_size_original * get_viewport_rect().size.x / 720)
		$preco.reset_size()
		$unidades/escrita.position.x = escrita_original["position"].x * get_viewport_rect().size.x / 720
		$unidades/escrita.position.y = escrita_original["position"].y * get_viewport_rect().size.x / 720
		$unidades/escrita.add_theme_font_size_override("font_size", escrita_original["font_size"] * get_viewport_rect().size.x / 720)
		$unidades/escrita.reset_size()
		$unidades.global_position.x = $dinheiro.global_position.x
		$unidades.global_position.y = $preco.global_position.y + $preco.size.y + 20 * get_viewport_rect().size.x / 720
		$unidades.add_theme_font_size_override("font_size", unidades_font_size_original * get_viewport_rect().size.x / 720)
		$unidades.reset_size()
		$comprar/texto.position.x = comprar_original["texto_position"].x * get_viewport_rect().size.x / 720
		$comprar/texto.position.y = comprar_original["texto_position"].y * get_viewport_rect().size.x / 720
		$comprar/texto.add_theme_font_size_override("font_size", comprar_original["texto_font_size"] * get_viewport_rect().size.x / 720)
		$comprar/texto.reset_size()
		$comprar.global_position.x = $dinheiro.global_position.x
		$comprar.global_position.y = $unidades.global_position.y + $unidades.size.y + 20 * get_viewport_rect().size.x / 720
		$comprar.size.x = comprar_original["fundo_size"].x * get_viewport_rect().size.x / 720
		$comprar.size.y = comprar_original["fundo_size"].y * get_viewport_rect().size.x / 720
		$sobre.global_position.x = $dinheiro.global_position.x
		$sobre.global_position.y = $comprar.global_position.y + $comprar.size.y + 20 * get_viewport_rect().size.x / 720
		$sobre.add_theme_font_size_override("normal_font_size", sobre_original_font_size * get_viewport_rect().size.x / 720)
		$sobre.size = Vector2(get_viewport_rect().size.x - $dinheiro.global_position.x * 2, 0)
		size_y = $sobre.global_position.y + $sobre.size.y
	elif get_viewport_rect().size.x / get_viewport_rect().size.y >= 1:
		$dinheiro.global_position.x = texto_dinheiro_original["global_position"].x * get_viewport_rect().size.y / 720
		$dinheiro.global_position.y = texto_dinheiro_original["global_position"].y * get_viewport_rect().size.y / 720
		$dinheiro.add_theme_font_size_override("font_size", texto_dinheiro_original["font_size"] * get_viewport_rect().size.y / 720 / 2)
		$dinheiro.reset_size()
		if ($imagem.size.y * get_viewport_rect().size.y / 720 * 0.5 / get_viewport_rect().size.x < 0.5):
			$imagem.scale = Vector2(get_viewport_rect().size.y / 720 * 0.5, get_viewport_rect().size.y / 720 * 0.5)
			$imagem.global_position.y = $dinheiro.global_position.y + $dinheiro.size.y + 20 * get_viewport_rect().size.y / 720 * 0.5
		else:
			$imagem.scale = Vector2(get_viewport_rect().size.y / 720 * 0.5, get_viewport_rect().size.y / 720 * 0.5)
			$imagem.global_position.y = $dinheiro.global_position.y + $dinheiro.size.y + 20 * get_viewport_rect().size.y / 720 * 0.5
		$nome.global_position.x = $dinheiro.global_position.x
		$nome.global_position.y = $imagem.global_position.y + $imagem.size.y * $imagem.scale.y
		$nome.add_theme_font_size_override("font_size", nome_font_size_original * get_viewport_rect().size.y / 720 * 0.5)
		$nome.reset_size()
		$autor.global_position.x = $dinheiro.global_position.x
		$autor.global_position.y = $nome.global_position.y + $nome.size.y
		$autor.add_theme_font_size_override("font_size", autor_font_size_original * get_viewport_rect().size.y / 720 * 0.5)
		$autor.reset_size()
		$preco.global_position.x = $dinheiro.global_position.x
		$preco.global_position.y = $autor.global_position.y + $autor.size.y
		$preco.add_theme_font_size_override("font_size", preco_font_size_original * get_viewport_rect().size.y / 720 * 0.5)
		$preco.reset_size()
		$unidades/escrita.position.x = escrita_original["position"].x * get_viewport_rect().size.y / 720 * 0.5
		$unidades/escrita.position.y = escrita_original["position"].y * get_viewport_rect().size.y / 720 * 0.5
		$unidades/escrita.add_theme_font_size_override("font_size", escrita_original["font_size"] * get_viewport_rect().size.y / 720 * 0.5)
		$unidades/escrita.reset_size()
		$unidades.global_position.x = $dinheiro.global_position.x
		$unidades.global_position.y = $preco.global_position.y + $preco.size.y
		$unidades.add_theme_font_size_override("font_size", unidades_font_size_original * get_viewport_rect().size.y / 720 * 0.5)
		$unidades.reset_size()
		$comprar/texto.position.x = comprar_original["texto_position"].x * get_viewport_rect().size.y / 720 * 0.5
		$comprar/texto.position.y = comprar_original["texto_position"].y * get_viewport_rect().size.y / 720 * 0.5
		$comprar/texto.add_theme_font_size_override("font_size", comprar_original["texto_font_size"] * get_viewport_rect().size.y / 720 * 0.5)
		$comprar/texto.reset_size()
		$comprar.global_position.x = $dinheiro.global_position.x
		$comprar.global_position.y = $unidades.global_position.y + $unidades.size.y + 40 * get_viewport_rect().size.y / 720 * 0.5
		$comprar.size.x = comprar_original["fundo_size"].x * get_viewport_rect().size.y / 720 * 0.5
		$comprar.size.y = comprar_original["fundo_size"].y * get_viewport_rect().size.y / 720 * 0.5
		$sobre.global_position.x = $imagem.global_position.x + $imagem.size.x * $imagem.scale.x + 40 * get_viewport_rect().size.y / 720 * 0.5
		$sobre.global_position.y = $dinheiro.global_position.y
		$sobre.add_theme_font_size_override("normal_font_size", sobre_original_font_size * get_viewport_rect().size.y / 720)
		$sobre.size = Vector2(get_viewport_rect().size.x - $imagem.size.x * $imagem.scale.x - $dinheiro.global_position.x * 2, 0)
		size_y = $sobre.global_position.y + $sobre.size.y


func fechar() -> void:
	$"../../menu_loja/capas_produtos".get_node(str(name)).atualizar_dados(int($preco.text), int($unidades/escrita.text), $nome.text, str(name), $autor.text, $sobre.text)
	queue_free()


func _on_escrita_text_changed(new_text: String) -> void:
	# Verificação do text de $unidades/escrita, para permitir apenas algarismos
	for i in range(len(new_text)-1, -1, -1):
		if new_text[i] not in "0123456789":
			new_text = new_text.erase(i)
	if new_text != $unidades/escrita.text:
		$unidades/escrita.text = new_text
