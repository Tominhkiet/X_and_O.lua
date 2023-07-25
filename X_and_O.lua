-- Display function
board = {
    {Row_11 = '[ ]', Row_12 = '[ ]', Row_13 = '[ ]'},
    {Row_21 = '[ ]', Row_22 = '[ ]', Row_23 = '[ ]'},
    {Row_31 = '[ ]', Row_32 = '[ ]', Row_33 = '[ ]'}
}
local clock = os.clock
local function sleep(n) -- seconds
    local t0 = clock()
    while clock() - t0 <= n do end
end
----------------------------------------Config and Display functions---------------------------------------------
local function mode_player()
    io.write('Please select your mode [PvP/PvE] :')
    local mode = io.read()
    if string.lower(mode) == 'pvp' then
        return true
    elseif string.lower(mode) == 'pve' then
        return false
    end
end
local function show_board()
    print(board[1].Row_11 .. ' ' .. board[1].Row_12 .. ' ' .. board[1].Row_13)
    print(board[2].Row_21 .. ' ' .. board[2].Row_22 .. ' ' .. board[2].Row_23)
    print(board[3].Row_31 .. ' ' .. board[3].Row_32 .. ' ' .. board[3].Row_33)
end
local function display_x()
    io.write('Enter your col to draw X: ')
    x_col = io.read('*n')
    io.write('Enter row: ')
    x_row = io.read('*n')
end
local function o_computer()
    print("Please wait for computer's turn...")
    sleep(2)
    o_col = math.random(1, 3)
    print('O column:' .. ' ' .. o_col)
    o_row = math.random(1, 3)
    sleep(1)
    print('O row:' .. ' ' .. o_row)
end
local function display_o()
    io.write('Enter your col to draw O: ')
    o_col = io.read('*n')
    io.write('Enter row: ')
    o_row = io.read('*n')
end
------------------------------------------------- Game Over function------------------------------------------
local game_over = false
local function check_game()
    if board[1].Row_11 == '[X]' and board[1].Row_12 == '[X]' and board[1].Row_13 ==
        '[X]' then
        show_board()
        print('GAME OVER!!')
        game_over = true
    elseif board[2].Row_21 == '[X]' and board[2].Row_22 == '[X]' and
        board[2].Row_23 == '[X]' then
        show_board()
        print('GAME OVER!!')
        game_over = true
    elseif board[3].Row_31 == '[X]' and board[3].Row_32 == '[X]' and
        board[3].Row_33 == '[X]' then
        show_board()
        print('GAME OVER!!')
        game_over = true
        --------------------------------------------Vertical---------------------------------------------------
    elseif board[1].Row_11 == '[X]' and board[2].Row_21 == '[X]' and
        board[3].Row_31 == '[X]' then
        show_board()
        print('GAME OVER!!')
        game_over = true
    elseif board[1].Row_12 == '[X]' and board[2].Row_22 == '[X]' and
        board[3].Row_32 == '[X]' then
        show_board()
        print('GAME OVER!!')
        game_over = true
    elseif board[1].Row_13 == '[X]' and board[2].Row_23 == '[X]' and
        board[3].Row_33 == '[X]' then
        show_board()
        print('GAME OVER!!')
        game_over = true
        ----------------------------------------Diagonally-------------------------------------------------------
    elseif board[1].Row_13 == '[X]' and board[2].Row_22 == '[X]' and
        board[3].Row_31 == '[X]' then
        show_board()
        print('GAME OVER!!')
        game_over = true
    elseif board[1].Row_11 == '[X]' and board[2].Row_22 == '[X]' and
        board[3].Row_33 == '[X]' then
        show_board()
        print('GAME OVER!!')
        game_over = true
    end
    ----------------------------------------Game O -------------------------------------------------
    --------------------------------------Horizontal--------------------------------------------
    if board[1].Row_11 == '[O]' and board[1].Row_12 == '[O]' and board[1].Row_13 ==
        '[O]' then
        show_board()
        print('GAME OVER!!')
        game_over = true
    elseif board[2].Row_21 == '[O]' and board[2].Row_22 == '[O]' and
        board[2].Row_23 == '[O]' then
        show_board()
        print('GAME OVER!!')
        game_over = true
    elseif board[3].Row_31 == '[O]' and board[3].Row_32 == '[O]' and
        board[3].Row_33 == '[O]' then
        show_board()
        print('GAME OVER!!')
        game_over = true
        --------------------------------------------Vertical---------------------------------------------------
    elseif board[1].Row_11 == '[O]' and board[2].Row_21 == '[O]' and
        board[3].Row_31 == '[O]' then
        show_board()
        print('GAME OVER!!')
        game_over = true
    elseif board[1].Row_12 == '[O]' and board[2].Row_22 == '[O]' and
        board[3].Row_32 == '[O]' then
        show_board()
        print('GAME OVER!!')
        game_over = true
    elseif board[1].Row_13 == '[O]' and board[2].Row_23 == '[O]' and
        board[3].Row_33 == '[O]' then
        show_board()
        print('GAME OVER!!')
        game_over = true
        ----------------------------------------Diagonally-------------------------------------------------------
    elseif board[1].Row_13 == '[O]' and board[2].Row_22 == '[O]' and
        board[3].Row_31 == '[O]' then
        show_board()
        print('GAME OVER!!')
        game_over = true
    elseif board[1].Row_11 == '[O]' and board[2].Row_22 == '[O]' and
        board[3].Row_33 == '[O]' then
        show_board()
        print('GAME OVER!!')
        game_over = true
    end
    -------------------------------------------Game draw--------------------------------------------------
    if board[1].Row_11 ~= '[ ]' and board[1].Row_12 ~= '[ ]' and board[1].Row_13 ~=
        '[ ]' and board[2].Row_21 ~= '[ ]' and board[2].Row_22 ~= '[ ]' and
        board[2].Row_23 ~= '[ ]' and board[3].Row_31 ~= '[ ]' and
        board[3].Row_32 ~= '[ ]' and board[3].Row_33 ~= '[ ]' and game_over ==
        false then
        print('GAME TIE!!!')
        game_over = true
    end
end
--------------------------------------------Check X function---------------------------------------------------
local valid_x = false
local function check_x_player()
    while valid_x == false or x_col > 3 or x_row > 3 do

        if board[x_row]['Row_' .. x_row .. x_col] == '[ ]' then
            board[x_row]['Row_' .. x_row .. x_col] = '[X]'
            valid_x = true
        else
            io.write('Pls re-enter col for X: ')
            x_col = io.read('*n')
            io.write('Re-enter row: ')
            x_row = io.read('*n')

        end
    end
    valid_x = false
end
------------------------------------------Check O function-----------------------------------------
local valid_o = false
local function check_o_player()
    while valid_o == false or o_col > 3 or o_row > 3 do
        if board[o_row]['Row_' .. o_row .. o_col] == '[ ]' then
            board[o_row]['Row_' .. o_row .. o_col] = '[O]'
            valid_o = true
        else
            io.write('Pls re-enter col for O: ')
            o_col = io.read('*n')
            io.write('Re-enter row: ')
            o_row = io.read('*n')
        end
    end
    valid_o = false
end
------------------------------------------Check O Computer-----------------------------------------------
local function check_o_computer()
    while valid_o == false or o_col > 3 or o_row > 3 do
        if board[o_row]['Row_' .. o_row .. o_col] == '[ ]' then
            board[o_row]['Row_' .. o_row .. o_col] = '[O]'
            valid_o = true
        else
            o_row = math.random(1, 3)
            o_col = math.random(1, 3)
        end
    end
    valid_o = false
end
-------------------------------------------RUN THE GAME--------------------------------------------
if mode_player() == true then
    while game_over == false do
        show_board()
        display_x()
        check_x_player()
        check_game()
        if game_over == false then
            show_board()
            display_o()
            check_o_player()
            show_board()
            print('-----------')
            check_game()
        end
    end
elseif mode_player() == false then
    while game_over == false do
        show_board()
        display_x()
        check_x_player()
        if game_over == false then
            show_board()
            o_computer()
            check_o_computer()
            show_board()
            print('-----------')
            check_game()
        end
    end
end
