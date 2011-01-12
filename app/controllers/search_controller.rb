class SearchController < ApplicationController
  def index
    @q = params[:q].strip
#     @type = params[:type]
#     if @type == 'titles'
      @titles = Title.find_by_sql("
        SELECT *
        FROM titles
        WHERE title || ' ' || subtitle LIKE('%#{params[:q]}%')
      " )
#     elsif @type == 'authors'
#       @titles = Author.find_by_sql("
#         SELECT t.*
#         FROM authors a
#         LEFT JOIN titles t
#         ON t
#         WHERE title || ' ' || subtitle LIKE('%#{params[:q]}%')
#       " )
#     else
#       @titles = []
#     end
  end
end
