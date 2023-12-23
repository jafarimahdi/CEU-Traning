#TODO: Create a letter using starting_letter.txt 
#for each name in invited_names.txt
#Replace the [name] placeholder with the actual name.
#Save the letters in the folder "ReadyToSend".


invitation = open("Input/Letters/starting_letter.txt", "r")
text_in_invitation = ''.join(invitation.readlines())
# print(text_in_invitation)


list_of_guess = open("Input/Names/invited_names.txt", "r")
names = list_of_guess.readlines()
# print(names)

for item in names:
    replace_name = item.strip()
    text_in_invitation.replace("name", f"{replace_name}")
    # print(text_in_invitation)



