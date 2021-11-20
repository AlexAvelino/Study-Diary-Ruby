require_relative "StudyItem"
require_relative "Category"

while true
    Gem.win_platform? ? (system "cls") : (system "clear")
    puts "Bem vindo ao diario de estudos, seu companheiro para estudar!"
    puts <<~MENU
    [1] Cadastrar um item para estudar
    [2] Ver todos os itens cadastrados
    [3] Buscar um item de estudo
    [4] Sair
    MENU
    print "Escolha uma opção: "
    escolha = gets.chomp.to_i

    categoria = Category.new.category

    case escolha
    when 1
       print "Digite o titulo do seu item de estudo: "
       titulo = gets.chomp
       Category.new.show_category
       print "Escolha uma categoria para o seu item de estudo: "
       c_indice = gets.chomp.to_i
       item = StudyItem.new(title: titulo, category: categoria[c_indice - 1]).save_to_db
       puts "Item #{titulo} da categoria #{categoria[c_indice - 1]} cadastrado"
    when 2
        StudyItem.all
    when 3
      print "Digite uma palavra para procurar: "
      titulo = gets.chomp
      StudyItem.find_by_title(titulo)
    when 4
        break
    else 
        puts "Opção inválida"
    end
    puts "Aperte Enter para contínuar"
    gets

end
puts "Obrigado por usar o diário de estudos!"

