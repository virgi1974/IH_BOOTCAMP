class Link < ActiveRecord::Base

  def self.check_already_exist link
    if Link.find_by(longlink: link)
      false
    end
  end

  def self.create_url link
    value = ""
    3.times{value  << (65 + rand(25)).chr}

    link = Link.new(
        :longlink => link,
        :shortlink => value,
        :visited => 0 )
    link.save
      
  end

  def self.show_url url_num
    link = Link.where("shortlink = ?", url_num)
    link[0].visited+= 1
    link[0].save
  # binding.pry
    if(link && link[0].longlink.include?("http://"))
      return "#{link.first.longlink}"
    elsif(link && link[0].longlink.include?("http://") == false)
      return "http://#{link.first.longlink}"
    else
      return 
    end
  end

  def self.find_most num
    links = Link.limit(num).order('visited DESC')
  end

end
