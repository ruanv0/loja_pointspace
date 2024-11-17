extends Panel

var autor: String
var sobre: String


func atualizar_dados(preco_por_unidade: int, unidades: int, nome: String, codinome: String, autor_: String, sobre_: String) -> void:
	$produto.texture = load("res://imagens_produtos/" + codinome + ".png")
	$nome.text = nome
	name = codinome
	var preco_string = str(preco_por_unidade)
	for index in range(len(preco_string), 0, -3):
		preco_string = preco_string.insert(index, " ")
	$preco.text = "R$ " + str(preco_string)
	$unidades/escrita.text = str(unidades)
	autor = autor_
	sobre = sobre_


func _on_escrita_text_changed(new_text) -> void:
	# Verificação do text de $unidades/escrita, para permitir apenas algarismos
	for i in range(len(new_text)-1, -1, -1):
		if new_text[i] not in "0123456789":
			new_text = new_text.erase(i)
	if new_text != $unidades/escrita.text:
		$unidades/escrita.text = new_text
