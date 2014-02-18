module StaticPagesHelper
  def set_ladder_pos
    ladderpos = 1
    users = User.all(:order => "win_percent ASC")
    users.each do |user|
      user.ladder_pos = ladderpos
      ladderpos += 1
    end
  end
end
