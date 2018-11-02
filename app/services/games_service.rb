class GamesService
  attr_accessor :current_user, :next_step_user, :new_result

  CROSS = ['00', '11', '22'].freeze
  UP_CROSS = ['02', '11', '20'].freeze

  def initialize(params, user, results)
    @current_user = user ||= '1'
    user_move_history = results ||= Hash.new
    results_of_current_user = user_move_history[current_user] ||= Array.new
    results_of_current_user.push(params[:value])
    @next_step_user = @current_user == '1'? '2' : '1'
    @new_result = results
  end

  def message
    @current_user == '1' ? 'X' : 'O'
  end

  def update_flash
    [@next_step_user, @new_result]
  end

  def check_results
    movement_list = @new_result[@current_user]
    win = true if (UP_CROSS - movement_list).empty? || (CROSS - movement_list).empty?
    first = movement_list.map(&:first)
    last = movement_list.map(&:last)
    win ||= first.detect{ |e| first.count(e) > 2 } || last.detect{ |e| last.count(e) > 2 }
    win
  end
end