class Page < ActiveRecord::Base
  # setup ancestry
  has_ancestry
  
  # associations
  has_many :photos, :as => :attachable
  accepts_nested_attributes_for :photos, :reject_if => proc{|attributes| attributes['image'].blank?}
  
  # we can act like wordpress and do some cool stuff too!
  before_validation :generate_slug, :generate_display_name, :generate_description, :generate_keywords, :generate_change_frequency, :generate_priority
  
  # validations
  validates :slug, :title, :display_name, :content, :description, :keywords, :presence => true
  validates :slug, :uniqueness => true
  
  COMMON_WORDS = ["a", "about", "after", "all", "alos", "an", "and", "any", "as", "at", "back", "be", "because", "but", "by", "can", "come", "could", "day", "do", "even", "first", "for", "from", "get", "give", "go", "good", "have", "he", "her", "him", "his", "how", "i", "if", "in", "into", "it", "its", "just", "know", "like", "look", "make", "me", "most", "my", "new", "no", "not", "now", "of", "on", "one", "only", "or", "other", "our", "out", "over", "person", "say", "see", "she", "so", "some", "take", "than", "that", "the", "their", "them", "then", "there", "these", "they", "think", "this", "time", "to", "two", "up", "us", "use", "want", "way", "we", "well", "what", "when", "which", "who", "will", "with", "work", "would", "year", "you", "your", "is"]
  
  class << self
    def right_nav
      where(['pages.right_nav = ?', true])
    end
    
    def left_nav
      where(['pages.right_nav = ?', false])
    end
  end
  
  private
  def generate_slug
    self.slug = (self.ancestors << self).collect{|a| a.title.parameterize}.join('/')
    return true
  end
  
  def generate_description
    self.description ||= self.content.split(/\s/)[0..50].join(' ') unless self.content.blank?
  end
  
  def generate_display_name
    self.display_name ||= self.title
  end
  
  def generate_keywords
    freqs = Hash.new(0)
    text = [self.title, self.display_name, self.description, self.content].join(' ')
    words = text.split(/\s/)
    words.each do |w|
      word = w.downcase.gsub(/[^a-z]/, '').strip
      freqs[word] += 1 unless word.blank? || COMMON_WORDS.include?(word)
    end
    self.keywords = freqs.sort_by{|k,v| v}.reverse![0..10].collect{|a| a.first}.join(', ')
  end
  
  def generate_change_frequency
    self.change_frequency ||= 'monthly'
  end
  
  def generate_priority
    self.priority ||= '0.1'
  end
end