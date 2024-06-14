# Caliber
Caliber is not your average e-store, neither it is your 'put the item in your cart and press confirm order' simulator. Infact I am surprised why none of you fucking idiots tried making this in the first place. Loser ass mfs rotting in their parent's basements drinking Mountain Dew, playing Call of Duty, getting a 4 kill streak and celebrating like it's their best acheivement of the day. Honestly, fuck this.

Now the average white collar guy will look at this project and say what the fuck is up with that intro, well fuck them too. You think I enjoy programming? It is the least human thing I do the entire day. Telling a machine to follow my will, fuck off. Infact, I made this because I would rather work in a coal mine than program your fucking backend/frontend. Lame ass niggas think making public service apps makes them look like heroes. Thinking some breast cancer analyzer app will get them to where they want to be. Listen to me, your brain is already mush by the route you take to office, then your gooning session at home is like your mind in a mortar and pestle. The 5% of sanity you have left is poured into your job, you are a yes man lietuenant. You bend to the will of your superiors, you'd say yes for money, because you lack all the self respect in this world. You'd cheat to get ahead, and you would sell your soul the moment it felt it was out of your hand. When's the last time you told your superior to stick it in their ass? Probably never, but you know what, I am probably doing it as you read.

Anyways, Cha Cha, if you have read this far, Хорошо, let's move on to the nitty gritty details and how it all works.

## Weapon Structure

![alt text](https://t3.ftcdn.net/jpg/04/26/67/32/360_F_426673284_U7e0CGd8ABcuuBsnEZL595y4VODOgK00.jpg)

This is how you look at any gun.

![alt text](https://github.com/SBSixteen/Caliber-App/blob/main/assets/fonts/Screenshots/GunDissaembly.PNG?raw=true)

This is how I look at gun, that is difference between me and you.

Now Cha Cha, if you had any ounce of Intellectual Quotient inside you, you would realize where this all is heading but if Cha Cha watches brainrot on social media daily, I explain, no worry, сволоч.

Now guns are made up of parts, you know it, I know it, your mom knows it. Now if you were to make a gun store, which is less probable than the day of judgement occuring while you read this, because you're a pussy obviously, you would make an item, call it a gun, something like

    class Item {
        String name;
        String desc;
        String productID;
        double price;
        String imageURL;
        double rating;
    }

Let me tell you something retard, if this is your idea of making a gun e-store, go back to the thinking tank, and believe that the Imposter Syndrome is true. You see, a gun is made up of the parts stated above, in the picture. Now that is an AK-47, if it were a different gun, parts would be different, like really different. Sometimes a receiver is a composite of an upper and lower receiver, sometimes a barrel is made up of a gas block and a barrel. A stock may have an optional buffer tube etc. The iterations are too many, but I make list for you Cha Cha, because I am nice.

      "Barrel",
      "Bipod",
      "Bolt Assembly",
      "Buffer Tube",
      "Charging Handle",
      "Chassis",
      "Dust Cover",
      "Front Sight",
      "Gas Tube",
      "Grip",
      "Hammer",
      "Handguard",
      "Lower Handguard",
      "Magazine",
      "Muzzle",
      "Optic",
      "Pistol Slide",
      "Platform",
      "Rear Sight",
      "Stock",
      "Trigger",
      "Upper Handguard",
      "Upper Receiver"    

Now Cha Cha, I can feel blood running, yours. Think about it Cha Cha, the OOP circus SBSixteen had to do to make this. Now Cha Cha, don't be deluded, don't say that probably the guns are something like

    class Item {
        String name;
        String desc;
        String productID;
        double price;
        String imageURL;
        double rating;
        Attachment? Barrel;
        Attachment? Bipod;
        ...
        ...
        ...
        Attachment? UpperHandguard;
        Attachment? UpperRecevier;
    }

It is not like that. Think about it Cha Cha, imagine you have froot stall, you have pineapple, coconut and berry, you also have price board which say pineapple 30rub, coconut 25rub and berry 18rub. Now Cha Cha, wouldn't it be weird if you put a price tag Banana 12rub? Yes it would be Cha Cha because your stall does not have banana. Similarly, if gun don't have bipod, why declare variable of bipod. Now Cha Cha, don't say you have put Nullable after attachment, which means "idk it may be there or not?" but Cha Cha, this is your imagination, not mine. The Item class is your head, not mine. Also clutter Cha Cha, think about the Clutter!

I did the weapon attachments by using a simple Dictionary. It is basically <String, Attachment>. Now the keys are the part position and entries are the attachment. Now patience Cha Cha, I know you have questions. Nothing good comes out of quick. Now how it works, first we do API call, lets say you like this gun

![image](https://github.com/SBSixteen/Caliber-App/assets/77447920/f0608d7b-a578-48d0-a87e-8666ed79f35d)

Now you want to customize or buy it, it is simple, you tap and this happens:

    API : https://localhost:7069/api/WeaponStructure/GetWeaponStructureOf?weaponName=AK-74M

    Response:
    [
      "Magazine",
      "Dust Cover",
      "Muzzle",
      "Handguard",
      "Platform",
      "Rear Sight",
      "Grip",
      "Stock"
    ]

Now the mobile knows what parts gun have, the dictionary is populated but no entries. To get entry, we do

    API : https://localhost:7069/api/Attachment/GetDefaultKitOfWeapon?gunname=AK-74M

    Response : Default Weapon Parts of this gun.

Now the response is long Cha Cha, it would make for bad reading experience, but I can give you one item from this list of parts

    {
    "attachmentName": "6L23",
    "attachmentDescription": "30-round polymer Izhmash 6L23 magazine for 5.45x39 ammo, for AK-74 and compatible systems.",
    "attachmentPart": "Magazine",
    "attachmentMake": "Izhmash Factories",
    "attachmentPrice": 1337,
    "attachmentPiccatiny_Top": 0,
    "attachmentPiccatiny_Bottom": 0,
    "attachmentPiccatiny_Left": 0,
    "attachmentPiccatiny_Right": 0,
    "attachment_AttachesToRail": 0,
    "attachment_AttachesToDovetail": 0,
    "attachment_DovetailMount": 0
    }

Now (attachmentPart == Position) and you should work it out by yourself now Cha Cha. This leads to the weapon creator which I am too lazy to explain Cha Cha, why don't you message me on discord and I tell you how it works. For now I will have Big Shot Cream Soda. I will update this someday! Till then Cha Cha
