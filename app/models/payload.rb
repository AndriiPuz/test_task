# frozen_string_literal: true

class Payload < ApplicationRecord



  def self.search_by_relevant(str)
    # Split the search into two parts
    words = str.split(' ')
    # Arel.sql gives access to write a query with CASE to do a request for search by relevance
    order(Arel.sql("CASE WHEN name LIKE '#{words[0]}%' THEN 1 WHEN name LIKE '%#{words[0]}%' THEN 2 ELSE 3 END"))
  end

  def self.search(search)
    # Split the search into two parts
    words = search.split(' ')
    # Check if field include '-',if so  remove the '-' and send a request to the database
    if search.include?('-')
      words[1].slice!(0)
      where('designed_by LIKE ? OR name LIKE ?', "%#{words[0]}%", "%#{words[0]}%").where.not('ptype LIKE ?',
                                                                                             "%#{words[1]}%").search_by_relevant(search)
    # In the last case only send a request to the database and search data
    else
      where('(name LIKE ? AND name LIKE ?) OR (designed_by LIKE ? AND designed_by LIKE ?)', "%#{words[0]}%",
            "%#{words[1]}%", "%#{words[1]}%", "%#{words[0]}%").search_by_relevant(search)
    end
  end

  # 5 data lines per view
  paginates_per 5
end

