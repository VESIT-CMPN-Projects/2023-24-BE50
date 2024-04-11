% Import the CSV file
data = readtable('D:\BE Project\autism_screening.csv');  % Replace with the correct file path

% Assume these are the feature columns in the dataset
A1 = data.A1_Score;
A2 = data.A2_Score;
A3 = data.A3_Score;
A4 = data.A4_Score;
A5 = data.A5_Score;
A6 = data.A6_Score;
A7 = data.A7_Score;
A8 = data.A8_Score;
A9 = data.A9_Score;
A10 = data.A10_Score;

% Membership functions for high, medium, and low
high_membership = @(x) min(max(x - 0.7, 0) / 0.3, 1); % High membership function
medium_membership = @(x) max(min((x - 0.2) / 0.6, 1), 0); % Medium membership function
low_membership = @(x) max(min(1 - x / 0.2, 1), 0); % Low membership function
disp('A1:A sibling with autism')
disp('A2:Older parents')
disp('A3:Certain genetic conditions, such as Down, fragile X, and Rett syndromes')
disp('A4:Very low birth weight')
disp('A5:Advanced parental age at time of conception')
disp('A6:Prenatal exposure to air pollution or certain pesticides')
disp('A7:Maternal obesity, diabetes, or immune system disorders')
disp('A8:Extreme prematurity or very low birth weight')
disp('A9:Any birth difficulty leading to periods of oxygen deprivation to the baby’s brain')
disp('A10:Behavioral changes')

% Get user input for A1 to A10 (0 or 1)
A_values = zeros(1, 10);
for i = 1:10
    A_values(i) = input(['Enter value for A', num2str(i), ' (0(No) or 1(Yes): ']);
end

% Initialize membership degrees for each input
    membership_degrees = zeros(length(A_values), 3);  % Each input has 3 membership degrees

    % Compute membership degrees for each input
    for i = 1:length(A_values)
        membership_degrees(i, 1) = high_membership(A_values(i)); % High membership
        membership_degrees(i, 2) = medium_membership(A_values(i)); % Medium membership
        membership_degrees(i, 3) = low_membership(A_values(i)); % Low membership
    end

% Applying the rules and predicting ASD status
is_autism_predicted = predict_asd_all(membership_degrees);

% Display the result
disp('Predicted ASD Status:');
disp(is_autism_predicted)