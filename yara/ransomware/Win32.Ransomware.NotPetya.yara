rule Win32_Ransomware_NotPetya : tc_detection malicious
{
        
    meta:
        id = "2fLMzesxd3DmCpsrhdHqlM"
        fingerprint = "909b403ef41fc8bcdcb89a2da41e0dd636ac3b7d89744f2fc8b7dc4c39d1fd09"
        version = "1.0"
        first_imported = "2020-07-11"
        last_modified = "2020-07-11"
        status = "RELEASED"
        sharing = "TLP:WHITE"
        source = "REVERSINGLABS"
        author = "ReversingLabs"
        description = "Yara rule that detects NotPetya ransomware."
        category = "MALWARE"
        malware = "NOTPETYA"
        malware_type = "RANSOMWARE"
        tc_detection_type = "Ransomware"
        tc_detection_name = "NotPetya"
        tc_detection_factor = 5

    strings:
        $encrypt_file = {
            8B EC 83 EC ?? 53 56 57 33 F6 56 56 6A ?? 56 56 68 ?? ?? ?? ?? FF 75 ?? FF 15 ?? ?? 
            ?? ?? 8B F8 89 7D ?? 83 FF ?? 0F 84 ?? ?? ?? ?? 8D 45 ?? 50 57 FF 15 ?? ?? ?? ?? 89 
            75 ?? 39 75 ?? 7C ?? B8 ?? ?? ?? ?? 7F ?? 39 45 ?? 76 ?? 89 45 ?? 8B D8 56 53 56 6A 
            ?? 56 57 FF 15 ?? ?? ?? ?? 89 45 ?? 3B C6 74 ?? FF 75 ?? 56 56 6A ?? 50 FF 15 ?? ?? 
            ?? ?? 8B F8 3B FE 74 ?? 53 8D 45 ?? 50 8B 45 ?? 57 56 FF 75 ?? 56 FF 70 ?? FF 15 ?? 
            ?? ?? ?? 85 C0 74 ?? FF 75 ?? 57 FF 15 ?? ?? ?? ?? 57 FF 15 ?? ?? ?? ?? FF 75 ?? FF 
            15 ?? ?? ?? ?? FF 75 ?? FF 15 ?? ?? ?? ?? 5F 5E 5B C9 C2 ?? ?? 8B 45 ?? 89 45 ?? C1 
            E8 ?? 8D 58 ?? C7 45 ?? ?? ?? ?? ?? C1 E3 ?? E9 
        }

        $main = {
            55 8B EC 8B 45 ?? 53 56 8B 35 ?? ?? ?? ?? 57 BF ?? ?? ?? ?? 57 6A ?? BB ?? ?? ?? ?? 
            53 83 C0 ?? 6A ?? 50 FF D6 85 C0 75 ?? FF 15 ?? ?? ?? ?? 3D ?? ?? ?? ?? 75 ?? 57 6A 
            ?? 6A ?? EB ?? 3D ?? ?? ?? ?? 75 ?? 6A ?? 6A ?? 53 8B 45 ?? 6A ?? 83 C0 ?? 50 FF D6 
            85 C0 74 ?? 8B 75 ?? 8B C6 E8 ?? ?? ?? ?? 85 C0 74 ?? 56 6A ?? 56 E8 ?? ?? ?? ?? 56 
            E8 ?? ?? ?? ?? FF 76 ?? FF 15 ?? ?? ?? ?? 6A ?? FF 76 ?? FF 15 ?? ?? ?? ?? EB ?? 8B 
            75 ?? 56 FF 15 ?? ?? ?? ?? 5F 5E 33 C0 5B 5D C2 
        }

        $encryption_loop = {
            55 8B EC 83 E4 ?? 81 EC ?? ?? ?? ?? 83 7D ?? ?? 53 56 0F 84 ?? ?? ?? ?? 68 ?? ?? ?? 
            ?? FF 75 ?? 8D 84 24 ?? ?? ?? ?? 50 FF 15 ?? ?? ?? ?? 85 C0 0F 84 ?? ?? ?? ?? 8D 44 
            24 ?? 50 8D 84 24 ?? ?? ?? ?? 50 FF 15 ?? ?? ?? ?? 89 44 24 ?? 83 F8 ?? 0F 84 ?? ?? 
            ?? ?? 8B 1D ?? ?? ?? ?? 8B 75 ?? 8B 46 ?? 85 C0 74 ?? 6A ?? 50 FF 15 ?? ?? ?? ?? 85 
            C0 0F 84 ?? ?? ?? ?? 83 F8 ?? 0F 84 ?? ?? ?? ?? B9 ?? ?? ?? ?? 8D 44 24 ?? 66 8B 10 
            66 3B 11 75 ?? 66 85 D2 74 ?? 66 8B 50 ?? 66 3B 51 ?? 75 ?? 83 C0 ?? 83 C1 ?? 66 85 
            D2 75 ?? 33 C0 EB ?? 1B C0 83 D8 ?? 85 C0 0F 84 ?? ?? ?? ?? B9 ?? ?? ?? ?? 8D 44 24 
            ?? 66 8B 10 66 3B 11 75 ?? 66 85 D2 74 ?? 66 8B 50 ?? 66 3B 51 ?? 75 ?? 83 C0 ?? 83 
            C1 ?? 66 85 D2 75 ?? 33 C0 EB ?? 1B C0 83 D8 ?? 85 C0 0F 84 ?? ?? ?? ?? 8D 44 24 ?? 
            50 FF 75 ?? 8D 84 24 ?? ?? ?? ?? 50 FF 15 ?? ?? ?? ?? 85 C0 0F 84 ?? ?? ?? ?? F6 44 
            24 ?? ?? 74 ?? F7 44 24 ?? ?? ?? ?? ?? 75 ?? 8D 84 24 ?? ?? ?? ?? 50 68 ?? ?? ?? ?? 
            FF D3 85 C0 75 ?? 8B 45 ?? 56 48 50 8D 84 24 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? EB ?? 8D 
            44 24 ?? 50 FF 15 ?? ?? ?? ?? 8D 4C 24 ?? 8D 51 ?? 66 8B 31 83 C1 ?? 66 85 F6 75 ?? 
            2B CA D1 F9 8D 4C 4C ?? 3B C1 74 ?? 50 8D 84 24 ?? ?? ?? ?? 68 ?? ?? ?? ?? 50 FF 15 
            ?? ?? ?? ?? 83 C4 ?? 8D 84 24 ?? ?? ?? ?? 50 68 ?? ?? ?? ?? FF D3 85 C0 74 ?? FF 75 
            ?? 8D 84 24 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? 8D 44 24 ?? 50 FF 74 24 ?? FF 15 ?? ?? ?? 
            ?? 85 C0 0F 85 ?? ?? ?? ?? FF 74 24 ?? FF 15 ?? ?? ?? ?? 5E 5B 8B E5 5D C2 
        }

        $shutdown = {
            68 ?? ?? ?? ?? 8B CA 8B D0 0F B7 45 ?? 03 C2 33 D2 F7 F6 0F B7 75 ?? 8D 85 ?? ?? ?? 
            ?? 50 03 F1 8B FA FF 15 ?? ?? ?? ?? 85 C0 0F 84 ?? ?? ?? ?? 68 ?? ?? ?? ?? 8D 85 ?? 
            ?? ?? ?? 50 FF 15 ?? ?? ?? ?? 85 C0 74 ?? E8 ?? ?? ?? ?? 85 C0 74 ?? F6 05 ?? ?? ?? 
            ?? ?? B8 ?? ?? ?? ?? 75 ?? B8 ?? ?? ?? ?? 56 57 8D 8D ?? ?? ?? ?? 51 50 8D 85 ?? ?? 
            ?? ?? 68 ?? ?? ?? ?? 50 FF 15 ?? ?? ?? ?? 83 C4 ?? EB ?? 8D 85 ?? ?? ?? ?? 50 56 57 
            8D 85 ?? ?? ?? ?? 68 ?? ?? ?? ?? 50 FF 15 ?? ?? ?? ?? 83 C4 ?? 33 C0 66 89 85 ?? ?? 
            ?? ?? 50 8D 85 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B D8 5F 5E 8B C3 5B C9 C3 
        }

    condition:
        uint16(0) == 0x5A4D and $encrypt_file and $main and $encryption_loop and $shutdown
                        
}
