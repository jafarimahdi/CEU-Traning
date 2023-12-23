#TODO: Create a letter using starting_letter.txt 
#for each name in invited_names.txt
#Replace the [name] placeholder with the actual name.
#Save the letters in the folder "ReadyToSend".


with open("Input/Names/invited_names.txt", "r") as list_of_guess:
    names = list_of_guess.readlines()

with open("Input/Letters/starting_letter.txt", "r") as invitation:
    text_in_invitation = ''.join(invitation.readlines())
    # print(text_in_invitation)

for item in names:
    replace_name = item.strip()
    add_name = text_in_invitation.replace("[name]", f"{replace_name}")
    with open(f"Output/ReadyToSend/Letter_to_{replace_name}.txt", mode="w") as file:
        file.write(add_name)
    # print(add_name)


