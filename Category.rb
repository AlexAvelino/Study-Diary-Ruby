class Category
    attr_accessor :category
    def initialize()
        @category = ["Ruby", "Rails", "HTML", "CSS", "Javascript", "Typescript"]
    end

    def show_category()
        @category.map.with_index(1) do |x, i|
            puts("[#{i}] - #{x}")
        end
    end
end


