# Caliber

A weapon e-store that actually understands how guns work.

**Tech Stack:** .NET 8 (ASP.NET Core API) | Flutter | SQL Server

---

## The Problem

Most e-commerce platforms treat products as flat items; a name, a price, an image, done. But guns aren't single items. They're assemblies of parts, and which parts exist varies dramatically by model.

Now, the average developer would look at a gun store requirement and write something like this:

```csharp
class Item {
    string Name;
    string Description;
    string ProductID;
    double Price;
    string ImageURL;
    double Rating;
}
```

And honestly? If this is your mental model for a weapon e-store, I invite you to revisit the thinking tank. Let me show you why.

---

## Weapon Structure

![How most people see a gun](https://t3.ftcdn.net/jpg/04/26/67/32/360_F_426673284_U7e0CGd8ABcuuBsnEZL595y4VODOgK00.jpg)

This is how most people look at a gun.

![How Caliber sees a gun](https://github.com/SBSixteen/Caliber-App/blob/main/assets/fonts/Screenshots/GunDissaembly.PNG?raw=true)

This is how Caliber looks at a gun. That's the difference.

---

## The Design Problem

Now Cha Cha, if you have any engineering intuition, you can see where this is heading. But let me walk you through it anyway.

Guns are made of parts. You know it, I know it. The image above shows an AK-47 ;  but if it were a different weapon, the parts would be different. Sometimes a receiver is a composite of upper and lower receivers. Sometimes a barrel includes a gas block. A stock may require an optional buffer tube. The variations are extensive.

Here's a partial list of possible attachment positions:

```
Barrel, Bipod, Bolt Assembly, Buffer Tube, Charging Handle, 
Chassis, Dust Cover, Front Sight, Gas Tube, Grip, Hammer, 
Handguard, Lower Handguard, Magazine, Muzzle, Optic, 
Pistol Slide, Platform, Rear Sight, Stock, Trigger, 
Upper Handguard, Upper Receiver
```

Now Cha Cha, I can already hear you thinking. You might propose something like this:

```csharp
class Item {
    string Name;
    string Description;
    string ProductID;
    double Price;
    string ImageURL;
    double Rating;
    Attachment? Barrel;
    Attachment? Bipod;
    // ...
    Attachment? UpperHandguard;
    Attachment? UpperReceiver;
}
```

But think about it, Cha Cha. Imagine you have a fruit stall selling pineapples, coconuts, and berries. Your price board lists each one. Now, wouldn't it be strange to include "Banana: 12 rubles" when your stall doesn't carry bananas?

The same logic applies here. If a gun doesn't support a bipod, why declare a bipod field? Yes, you've marked it nullable;  "maybe it's there, maybe not"; but that's your imagination compensating for a flawed model. Think about the clutter, Cha Cha. Think about the clutter.

---

## The Solution

Caliber uses a `Dictionary<string, Attachment>` where keys are part positions and values are the attachments. The structure is populated dynamically based on each weapon's actual configuration.

Here's how it works. Say you're browsing and you like this gun:

![Gun selection](https://github.com/SBSixteen/Caliber-App/assets/77447920/f0608d7b-a578-48d0-a87e-8666ed79f35d)

You tap to customize or purchase. First, the app queries the weapon's structure:

```
GET https://localhost:7069/api/WeaponStructure/GetWeaponStructureOf?weaponName=AK-74M

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
```

Now the mobile client knows exactly which parts this gun supports. The dictionary is initialized with these keys ;  but no values yet.

To populate the default configuration:

```
GET https://localhost:7069/api/Attachment/GetDefaultKitOfWeapon?gunname=AK-74M

Response: [Array of default attachments for this weapon]
```

Here's one item from that response:

```json
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
```

The `attachmentPart` field corresponds to the dictionary key. The rest follows naturally.

---

## Key Features

- **Dynamic weapon modeling**: No hardcoded nullable fields. Each gun defines only the parts it actually supports.
- **Attachment compatibility system**: Picatinny rails, dovetail mounts, and attachment constraints are modeled in the data.
- **Weapon customization flow**: Users can swap parts and see pricing updates in real-time.
- **Clean separation**: .NET API handles business logic and data; Flutter handles presentation.

---

## What's Next

The weapon creator system builds on this foundation; allowing users to assemble custom configurations from compatible parts. Documentation for that is coming soon.

Until then, Cha Cha. До свидания.

---

## Running Locally

### Backend (.NET API)
```bash
cd CaliberAPI
dotnet restore
dotnet run
```

### Mobile (Flutter)
```bash
cd caliber_mobile
flutter pub get
flutter run
```

### Database
SQL Server required. Connection string configured in `appsettings.json`.

---

## License

MIT
