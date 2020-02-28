require "pry"

def game_hash
  {:home => { :team_name => "Brooklyn Nets",
              :colors => [ "Black", "White"],
              :players => { "Alan Anderson" => {
                                :number => 0,
                                :shoe => 16,
                                :points => 22,
                                :rebounds => 12,
                                :assists => 12,
                                :steals => 3,
                                :blocks => 1,
                                :slam_dunks => 1
                                },
                          "Reggie Evans" => {
                              :number => 30,
                              :shoe => 14,
                              :points => 12,
                              :rebounds => 12,
                              :assists => 12,
                              :steals => 12,
                              :blocks => 12,
                              :slam_dunks => 7
                              },
                          "Brook Lopez" => {
                              :number => 11,
                              :shoe => 17,
                              :points => 17,
                              :rebounds => 19,
                              :assists => 10,
                              :steals => 3,
                              :blocks => 1,
                              :slam_dunks => 15
                              },
                          "Mason Plumlee" => {
                              :number => 1,
                              :shoe => 19,
                              :points => 26,
                              :rebounds => 12,
                              :assists => 6,
                              :steals => 3,
                              :blocks => 8,
                              :slam_dunks => 5
                              },
                          "Jason Terry" => {
                              :number => 31,
                              :shoe => 15,
                              :points => 19,
                              :rebounds => 2,
                              :assists => 2,
                              :steals => 4,
                              :blocks => 11,
                              :slam_dunks => 1
                              }
                            }
                          },
  :away => { :team_name => "Charlotte Hornets",
              :colors => ["Turquoise", "Purple"],
              :players => {
                      "Jeff Adrien" => {
                                :number => 4,
                                :shoe => 18,
                                :points => 10,
                                :rebounds => 1,
                                :assists => 1,
                                :steals => 2,
                                :blocks => 7,
                                :slam_dunks => 2
                              },
                            "Bismak Biyombo" => {
                              :number => 0,
                              :shoe => 16,
                              :points => 12,
                              :rebounds => 4,
                              :assists => 7,
                              :steals => 7,
                              :blocks => 15,
                              :slam_dunks => 10
                              },
                            "DeSagna Diop" => {
                              :number => 2,
                              :shoe => 14,
                              :points => 24,
                              :rebounds => 12,
                              :assists => 12,
                              :steals => 4,
                              :blocks => 5,
                              :slam_dunks => 5
                              },
                            "Ben Gordon" => {
                              :number => 8,
                              :shoe => 15,
                              :points => 33,
                              :rebounds => 3,
                              :assists => 2,
                              :steals => 1,
                              :blocks => 1,
                              :slam_dunks => 0
                              },
                            "Brendan Haywood" => {
                              :number => 33,
                              :shoe => 15,
                              :points => 6,
                              :rebounds => 12,
                              :assists => 12,
                              :steals => 22,
                              :blocks => 5,
                              :slam_dunks => 12
                              }
                            }
                          }
}
end

#returns the number of points scored for that player
def num_points_scored(name)
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, player_details|
          if player_name == name
            return player_details[:points]
          end
        end
      end
    end
  end
end

#puts num_points_scored ("Brendan Haywood") => 6

#returns the shoe size for a given player
  def shoe_size(name)
    game_hash.each do |place, team|
      team.each do |attribute, data|
        if attribute == :players
          data.each do |player_name, player_details|
            if player_name == name
              return player_details[:shoe]
            end
          end
        end
      end
    end
  end

  # puts shoe_size("Mason Plumlee") => 19

  #returns array of team colors
  def team_colors(team_name)
    game_hash.each do |place, team|
      if team[:team_name] == team_name
        return team[:colors]
      end
    end
  end

  # puts team_colors("Brooklyn Nets") => Black, White

  #returns array of team names
  def team_names_each
      array_team_names = []
      game_hash.each do |place, team|
        array_team_names.push(team[:team_name])
      end
    array_team_names
  end

  # puts team_names_each => Brooklyn Nets, Charlotte Hornets

  #returns an array of the jersey number's for the team
  def player_numbers(team_name)
      list_of_numbers = []
      game_hash.each do |team, team_details|
        if team_details[:team_name] == team_name
          team_details[:players].each do |player_name, player_details|
            list_of_numbers << player_details[:number]
          end
        end
      end
    list_of_numbers
  end

  # puts player_numbers("Brooklyn Nets") => 30,11,1,31

  #returns the hash of a player's stats
  def player_stats(player_name)
      new_hash = {}
      game_hash.each do |place, team|
        team.each do |attributes, data|
          if attributes == :players
            data.each do |player|
              if player[:player_name] == player_name
                new_hash = player.delete_if do |k,v|
                  k == :name
                end
            end
          end
        end
      end
    end
    new_hash
  end

  puts player_stats("Ben Gordon")

  #returns the number of rebounds associated with the player that has the largest shoe size.
  def big_shoe_rebounds
    size = 0
      game_hash.each do |team, team_details|
        team_details[:players].each do |player_name, player_details|
          if player_details[:shoe] > size
            size = player_details[:shoe]
            return player_details[:rebounds]
          end
        end
      end
  end
