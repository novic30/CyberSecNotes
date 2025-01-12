Challenge Synopsis:
*McSkidy's fingers flew across the keyboard, her eyes narrowing at the suspicious website on her screen. She had seen dozens of malware campaigns like this. This time, the trail led straight to someone who went by the name "Glitch."*

**"Too easy," she muttered with a smirk.

**"I still have time," she said, leaning closer to the screen. "Maybe there's more."

**Little did she know, beneath the surface lay something far more complex than a simple hacker's handle. This was just the beginning of a tangled web unravelling everything she thought she knew.

Now, let's solve the challenge step-by-step.
Note: 

After connecting to attackbox, we are told to investigate a website.

Website:![Alt text](../Images/Screenshot%202024-12-09%20at%2020.52.17.png)

**Some general info about such Youtube to MP3 Converter Websites given in Tryhackme challenge information:

These websites have been around for a long time. They offer a convenient way to extract audio from YouTube videos, making them popular. However, historically, these websites have been observed to have significant risks, such as:

- **Malvertising**: Many sites contain malicious ads that can exploit vulnerabilities in a user's system, which could lead to infection.
- **Phishing scams**: Users can be tricked into providing personal or sensitive information via fake surveys or offers.
- **Bundled malware**: Some converters may come with malware, tricking users into unknowingly running it.

On pasting a given youbtube link onto the website:![Alt text](../Images/Screenshot%202024-12-09%20at%2020.56.10.png)

We are able to download the converted file which is download.zip. Immediately, I feel that this is suspicious. I converted it from a youtube link to mp3. Despite this, the result is a zip file which shouldn't be the case. 
![Alt text](../Images/Screenshot%202024-12-09%20at%2020.57.02.png)

For the challenge, let's continue and extract it. After extraction, we have:![Alt text](../Images/Screenshot%202024-12-09%20at%2021.07.12.png)

Also, the other way of unzipping it:
![Alt text](../Images/Screenshot%202024-12-09%20at%2021.12.21.png)
Now that we have unzipped it, we can use "file" command to actually see what kind of file they are. Let's try it with song.mp3:
![Alt text](../Images/Screenshot%202024-12-09%20at%2021.15.13.png)
This seems normal to me and doesn't seem to be too much of a problem.
Now, let's try the other one:
![Alt text](../Images/Screenshot%202024-12-09%20at%2021.17.54.png)
This one doesn't seem like an audio file one bit. This file could potentially be harmful since it isn't the audio file it claimed to be. It is even more suspicious due to the fact that it points to a file/directory and has command line arguments. 

Note:
*Command line arguments is any specific information you have to provide to a command, for the command to do something.
Eg. we used ```file song.mp3``` in which song.mp3 could be considered the command line argument for the command: file.
The command line arguments present in the code indicate that it could perhaps be used to run some commands(maybe even some harmful ones) in the terminal.

Now that we know that it is suspicious, we should try to delve deeper into this file. One way of doing such a thing is the exiftool command:
![Alt text](../Images/Screenshot%202024-12-09%20at%2021.29.49.png)
Ironically, despite the name being somg.mp3, the file type is lnk. This file type is used in Windows to link to another file, folder, or application. These shortcuts can also be used to run commands!

When we go down, we can see that these are the Command Line Arguments present which this file plans to run:
![Alt text](../Images/Screenshot%202024-12-09%20at%2021.31.11.png)
What this PowerShell command does:
- The `-ep Bypass -nop` flags disable PowerShell's usual restrictions, allowing scripts to run without interference from security settings or user profiles.
- The `DownloadFile` method pulls a file (in this case, `IS.ps1`) from a remote server ([https://raw.githubusercontent.com/MM-WarevilleTHM/IS/refs/heads/main/IS.ps1](https://raw.githubusercontent.com/MM-WarevilleTHM/IS/refs/heads/main/IS.ps1)) and saves it in the `C:\\ProgramData\\` directory on the target machine.
- Once downloaded, the script is executed with PowerShell using the `iex` command, which triggers the downloaded `s.ps1` file.

This is the script from the github link is:
![Alt text](../Images/Screenshot%202024-12-09%20at%2021.41.47.png)
Basically, this script plans to search for:
- cryptocurrency wallets like bitcoin
- credentials of firefox and chrome
Next, it sends the found information back to the attacker.

Also, around the beginning, there is a phrase which is sort of like a copyright: "Created by the one and only M.M."

From the url(https://raw.githubusercontent.com/MM-WarevilleTHM/IS/refs/heads/main/IS.ps1), we know that this is a github repositry.

Let's try to find it out!
	


Using the first method, I reached a different repositry with almost the same description. Here:![Alt text](../Images/Screenshot%202024-12-09%20at%2021.57.39.png)

Somehow, I got similar descriptions coming from repositries of two different github accounts.
I am guessing that the first one is the one which actually was the actual attacker account due to the "MM-WareVilleTHM" matching the url(https://raw.githubusercontent.com/MM-WarevilleTHM/IS/refs/heads/main/IS.ps1). The IS.ps1 file is probably some file in the github project which doesn't show by default.

Nevertheless, we have successfully found out that the person who is causing this malware is: "Mayor Malware"
