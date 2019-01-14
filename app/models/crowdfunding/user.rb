class User
  attr_accessor :name

  @@all = []

  def initialize (name)
    @name = name

    self.class.all << self
  end

  def self.all
    @@all
  end

  def pledge_count
    pledges.length
  end

  def project_count
    projects.length
  end

  def pledges
    Pledge.all.select {|pledge| pledge.user == self}
  end

  def projects
    Project.all.select {|project| project.creator == self}
  end

  def self.highest_pledge
    Pledge.all.max_by{|pledge| pledge.amount}.user
  end

  def self.multi_pledger
    Project.all.select {|user| user.pledge_count > 1}
  end

  def self.project_creator
    all.select {|user| user.project_count >= 1}
  end
end
