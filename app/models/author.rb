class Author < ActiveRecord::Base


	has_many :books



	private
    
    def author_params
      params.require(:author).permit(:name, :country, :years, :note)
    end

end
