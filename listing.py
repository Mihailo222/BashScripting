import os

def list_all_files(folder):
    try:
        files = os.listdir(folder) #listaj sve fajove jednog foldera
        return files, None
    except FileNotFoundError:
        return None, "Folder %s do not exist:" % (folder)
    except PermissionError:
        return None, "Wrong premissions"
    

def main():

    folders = input("Enter folders for listing [ format /a /b /c ]: ").split()

    for folder in folders:
        print("Folder name: ",folder)
        files, error_message = list_all_files(folder)

        if files:
            print(files)
        else:
            print(error_message)


if __name__ == "__main__":
    main()
