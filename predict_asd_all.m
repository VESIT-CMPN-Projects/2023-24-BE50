% Function to predict ASD based on A1 to A10 values
function is_autism = predict_asd_all(A_values)

    % Membership functions for high, medium, and low
    high_membership = @(x) min(max(x - 0.7, 0) / 0.3, 1); % High membership function
    medium_membership = @(x) max(min((x - 0.2) / 0.6, 1), 0); % Medium membership function
    low_membership = @(x) max(min(1 - x / 0.2, 1), 0); % Low membership function
    
    % Apply membership functions for each A value
    membership_degrees = [high_membership(A_values(1)), high_membership(A_values(2)), ...
                          medium_membership(A_values(3)), high_membership(A_values(4)), ...
                          medium_membership(A_values(5)), low_membership(A_values(6)), ...
                          medium_membership(A_values(7)), medium_membership(A_values(8)), ...
                          high_membership(A_values(9)), low_membership(A_values(10))];

    % Determine the predicted ASD status based on membership degrees
    high_count = sum(membership_degrees([1, 2, 4, 9]));  % High membership for A1, A2, A4, A9
    medium_count = sum(membership_degrees([3, 5, 6, 7, 8]));  % Medium membership for A3, A5, A6, A7, A8
    low_count = sum(membership_degrees([6, 10]));  % Low membership for A6, A10

    % Determine predicted ASD status based on counts
    if medium_count > max(high_count, low_count)
        is_autism = 'Probably ASD';
    elseif high_count > max(medium_count, low_count)
        is_autism = 'ASD';
    else
        is_autism = 'No ASD'
    end
end
