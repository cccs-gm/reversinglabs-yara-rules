rule Win32_Ransomware_Spora : tc_detection malicious
{
    meta:
        id = "6FSYpvDwpCQwYYumrQ1QbY"
        fingerprint = "103ed6628404da98fbbd5c44bdd744cdbc182fa0e9f866ec8099e0cc38084149"
        version = "1.0"
        first_imported = "2020-07-11"
        last_modified = "2020-07-11"
        status = "RELEASED"
        sharing = "TLP:WHITE"
        source = "REVERSINGLABS"
        author = "ReversingLabs"
        description = "Yara rule that detects Spora ransomware."
        category = "MALWARE"
        malware = "SPORA"
        malware_type = "RANSOMWARE"
        tc_detection_type = "Ransomware"
        tc_detection_name = "Spora"
        tc_detection_factor = 5

    strings:

        $encrypt_files = {
            55 8D 6C 24 ?? 81 EC ?? ?? ?? ?? 57 FF 75 ?? 33 FF 89 7D ?? FF 15 ?? ?? ?? ?? 83 F8 
            ?? 0F 84 ?? ?? ?? ?? A8 ?? 74 ?? 83 E0 ?? 50 FF 75 ?? FF 15 ?? ?? ?? ?? 53 56 57 BE 
            ?? ?? ?? ?? 56 6A ?? 57 6A ?? 68 ?? ?? ?? ?? FF 75 ?? FF 15 ?? ?? ?? ?? 8B D8 83 FB 
            ?? 0F 84 ?? ?? ?? ?? 8D 45 ?? 50 53 89 7D ?? FF 15 ?? ?? ?? ?? 89 45 ?? 83 F8 ?? 0F 
            82 ?? ?? ?? ?? 6A ?? 57 68 ?? ?? ?? ?? 53 FF 15 ?? ?? ?? ?? 83 F8 ?? 0F 84 ?? ?? ?? 
            ?? 57 8D 45 ?? 50 56 8D 45 ?? 50 53 FF 15 ?? ?? ?? ?? 85 C0 0F 84 ?? ?? ?? ?? 39 75 
            ?? 0F 85 ?? ?? ?? ?? 57 8D 45 ?? 50 6A ?? 8D 45 ?? 50 53 FF 15 ?? ?? ?? ?? 85 C0 0F 
            84 ?? ?? ?? ?? 83 7D ?? ?? 0F 85 ?? ?? ?? ?? 56 8D 45 ?? 50 57 FF 15 ?? ?? ?? ?? 3B 
            45 ?? 0F 84 ?? ?? ?? ?? 39 7D ?? 74 ?? C7 45 ?? ?? ?? ?? ?? EB ?? 8B 45 ?? B9 ?? ?? 
            ?? ?? 3B C1 72 ?? 89 4D ?? EB ?? 83 E0 ?? 89 45 ?? 57 FF 75 ?? 57 6A ?? 57 53 FF 15 
            ?? ?? ?? ?? 89 45 ?? 3B C7 0F 84 ?? ?? ?? ?? FF 75 ?? 57 57 6A ?? 50 FF 15 ?? ?? ?? 
            ?? 89 45 ?? 3B C7 0F 84 ?? ?? ?? ?? 8D 45 ?? 50 6A ?? 68 ?? ?? ?? ?? FF 35 ?? ?? ?? 
            ?? FF 15 ?? ?? ?? ?? 85 C0 0F 84 ?? ?? ?? ?? 8D 45 ?? 50 8D 45 ?? 50 57 6A ?? 57 FF 
            75 ?? 89 75 ?? FF 15 ?? ?? ?? ?? 85 C0 74 ?? 56 8D 45 ?? 50 8D 45 ?? 50 57 6A ?? 57 
            FF 35 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 85 C0 74 ?? FF 75 ?? 8D 45 ?? 50 FF 75 ?? 57 57 
            57 FF 75 ?? FF 15 ?? ?? ?? ?? 85 C0 74 ?? 56 8D 45 ?? 50 57 FF 15 ?? ?? ?? ?? 6A ?? 
            57 57 53 89 45 ?? FF 15 ?? ?? ?? ?? 57 8D 45 ?? 50 56 8B 35 ?? ?? ?? ?? 8D 45 ?? 50 
            53 FF D6 57 8D 45 ?? 50 6A ?? 8D 45 ?? 50 53 FF D6 C7 45 ?? ?? ?? ?? ?? FF 75 ?? FF 
            15 ?? ?? ?? ?? FF 75 ?? FF 15 ?? ?? ?? ?? FF 75 ?? FF 15 ?? ?? ?? ?? EB ?? C7 45 ?? 
            ?? ?? ?? ?? 53 FF 15 ?? ?? ?? ?? 5E 5B 8B 45 ?? 5F 83 C5 ?? C9 C2 
        }

        $create_key_file = {
            55 8D 6C 24 ?? 81 EC ?? ?? ?? ?? 56 8D 45 ?? 50 68 ?? ?? ?? ?? 68 ?? ?? ?? ?? FF 35 
            ?? ?? ?? ?? 33 F6 89 75 ?? C7 45 ?? ?? ?? ?? ?? 89 75 ?? FF 15 ?? ?? ?? ?? 85 C0 0F 
            84 ?? ?? ?? ?? 57 8D 45 ?? 50 8D 45 ?? 50 56 6A ?? 56 FF 75 ?? BF ?? ?? ?? ?? 89 7D 
            ?? FF 15 ?? ?? ?? ?? 85 C0 0F 84 ?? ?? ?? ?? 57 8B 3D ?? ?? ?? ?? 8D 45 ?? 50 8D 45 
            ?? 50 56 6A ?? 56 FF 35 ?? ?? ?? ?? FF D7 FF 75 ?? FF 15 ?? ?? ?? ?? 83 E0 ?? 83 C0 
            ?? 50 89 45 ?? 8D 45 ?? 50 FF 75 ?? 56 56 56 FF 75 ?? FF D7 85 C0 0F 84 ?? ?? ?? ?? 
            53 8B 1D ?? ?? ?? ?? 68 ?? ?? ?? ?? 6A ?? FF D3 8B F8 3B FE 0F 84 ?? ?? ?? ?? 56 6A 
            ?? 57 56 FF 15 ?? ?? ?? ?? FF 75 ?? 68 ?? ?? ?? ?? 57 FF 15 ?? ?? ?? ?? 8D 04 47 50 
            FF 15 ?? ?? ?? ?? 83 C4 ?? 56 6A ?? 6A ?? 56 56 68 ?? ?? ?? ?? 57 FF 15 ?? ?? ?? ?? 
            89 45 ?? 83 F8 ?? 0F 84 ?? ?? ?? ?? 56 8D 4D ?? 51 FF 75 ?? FF 75 ?? 50 FF 15 ?? ?? 
            ?? ?? 85 C0 0F 84 ?? ?? ?? ?? 8B 45 ?? 3B 45 ?? 0F 85 ?? ?? ?? ?? 56 8D 45 ?? 50 68 
            ?? ?? ?? ?? 8D 45 ?? 50 FF 75 ?? FF 15 ?? ?? ?? ?? 85 C0 0F 84 ?? ?? ?? ?? 81 7D ?? 
            ?? ?? ?? ?? 75 ?? FF 75 ?? FF 15 ?? ?? ?? ?? FF 75 ?? C7 45 ?? ?? ?? ?? ?? 57 68 ?? 
            ?? ?? ?? E8 ?? ?? ?? ?? 68 ?? ?? ?? ?? 6A ?? FF D3 8B D8 3B DE 74 ?? 89 75 ?? 8B 45 
            ?? 56 FF 74 85 ?? 53 56 FF 15 ?? ?? ?? ?? 85 C0 74 ?? FF 75 ?? 68 ?? ?? ?? ?? 53 FF 
            15 ?? ?? ?? ?? 8D 04 43 50 FF 15 ?? ?? ?? ?? 83 C4 ?? 56 53 57 FF 15 ?? ?? ?? ?? FF 
            45 ?? 83 7D ?? ?? 72 ?? 53 FF 15 ?? ?? ?? ?? EB ?? FF 75 ?? FF 15 ?? ?? ?? ?? 57 FF 
            15 ?? ?? ?? ?? 5B FF 75 ?? FF 15 ?? ?? ?? ?? 5F 8B 45 ?? 5E 83 C5 ?? C9 C2 
        }

        $create_key = {
            55 8D 6C 24 ?? 81 EC ?? ?? ?? ?? 56 8D 45 ?? 50 68 ?? ?? ?? ?? 68 ?? ?? ?? ?? FF 35 
            ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 85 C0 0F 84 ?? ?? ?? ?? 53 57 8D 45 ?? 50 8D 45 ?? 50 
            33 DB 53 6A ?? 53 FF 75 ?? BE ?? ?? ?? ?? 89 75 ?? FF 15 ?? ?? ?? ?? 85 C0 0F 84 ?? 
            ?? ?? ?? 56 8B 35 ?? ?? ?? ?? 8D 45 ?? 50 8D 45 ?? 50 53 6A ?? 53 FF 35 ?? ?? ?? ?? 
            FF D6 FF 75 ?? FF 15 ?? ?? ?? ?? 83 E0 ?? 83 C0 ?? 50 89 45 ?? 8D 45 ?? 50 FF 75 ?? 
            53 53 53 FF 75 ?? FF D6 85 C0 0F 84 ?? ?? ?? ?? 8B 45 ?? 8B 4D ?? 8B 35 ?? ?? ?? ?? 
            03 C8 51 6A ?? FF D6 8B F8 89 7D ?? 3B FB 0F 84 ?? ?? ?? ?? FF 75 ?? FF 75 ?? 57 FF 
            15 ?? ?? ?? ?? FF 75 ?? 8D 45 ?? 50 8B 45 ?? 03 C7 50 FF 15 ?? ?? ?? ?? 8B 4D ?? 83 
            C4 ?? 8D 45 ?? 50 8B 45 ?? 53 6A ?? 03 C8 51 57 8B 3D ?? ?? ?? ?? FF D7 85 C0 74 ?? 
            FF 75 ?? 6A ?? FF D6 8B F0 3B F3 74 ?? 8B 4D ?? 8D 45 ?? 50 8B 45 ?? 56 6A ?? 03 C8 
            51 FF 75 ?? FF D7 33 FF 38 1E 74 ?? 8B C6 80 38 ?? 75 ?? 40 40 8A 08 88 0C 37 47 40 
            38 18 75 ?? 88 1C 37 EB ?? 8B 75 ?? FF 75 ?? FF 15 ?? ?? ?? ?? EB ?? 8B 75 ?? FF 75 
            ?? FF 15 ?? ?? ?? ?? 5F 5B EB ?? 8B 75 ?? 8B C6 5E 83 C5 ?? C9 C2 
        }

        $create_lst_file = {
            55 8D 6C 24 ?? 81 EC ?? ?? ?? ?? 53 56 68 ?? ?? ?? ?? 33 F6 6A ?? 89 75 ?? FF 15 ?? 
            ?? ?? ?? 8B D8 3B DE 0F 84 ?? ?? ?? ?? 8D 45 ?? 50 6A ?? 56 FF 15 ?? ?? ?? ?? 85 C0 
            0F 85 ?? ?? ?? ?? 53 E8 ?? ?? ?? ?? 85 C0 0F 84 ?? ?? ?? ?? 57 8B 45 ?? 8B 38 8D 45 
            ?? 50 53 83 C7 ?? FF 15 ?? ?? ?? ?? 03 C0 50 53 FF 75 ?? FF 17 8B 45 ?? 8B 08 8D 55 
            ?? 52 6A ?? 68 ?? ?? ?? ?? 50 FF 51 ?? 53 E8 ?? ?? ?? ?? 85 C0 75 ?? 8B 45 ?? 8B 08 
            8D 55 ?? 52 6A ?? 68 ?? ?? ?? ?? 50 FF 51 ?? 8D 45 ?? 50 FF 75 ?? FF 15 ?? ?? ?? ?? 
            85 C0 0F 85 ?? ?? ?? ?? FF 75 ?? FF 15 ?? ?? ?? ?? 89 45 ?? 3B C6 0F 84 ?? ?? ?? ?? 
            8B 3D ?? ?? ?? ?? 56 56 56 56 6A ?? 50 56 68 ?? ?? ?? ?? FF D7 89 45 ?? 3B C6 0F 84 
            ?? ?? ?? ?? 83 C0 ?? 50 6A ?? FF 15 ?? ?? ?? ?? 89 45 ?? 3B C6 0F 84 ?? ?? ?? ?? 56 
            56 FF 75 ?? 50 6A ?? FF 75 ?? 56 68 ?? ?? ?? ?? FF D7 8D 45 ?? 50 6A ?? 68 ?? ?? ?? 
            ?? FF 35 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 85 C0 0F 84 ?? ?? ?? ?? 8B 45 ?? 83 E0 ?? 83 
            C0 ?? 89 45 ?? 8D 45 ?? 50 8D 45 ?? 50 56 6A ?? 56 FF 75 ?? BF ?? ?? ?? ?? 89 7D ?? 
            FF 15 ?? ?? ?? ?? 85 C0 0F 84 ?? ?? ?? ?? 57 8D 45 ?? 50 8D 45 ?? 50 56 6A ?? 56 FF 
            75 ?? FF 15 ?? ?? ?? ?? 85 C0 0F 84 ?? ?? ?? ?? FF 75 ?? 8D 45 ?? 50 FF 75 ?? 56 56 
            56 FF 75 ?? FF 15 ?? ?? ?? ?? 85 C0 0F 84 ?? ?? ?? ?? 56 6A ?? 53 56 FF 15 ?? ?? ?? 
            ?? FF 75 ?? 68 ?? ?? ?? ?? 53 FF 15 ?? ?? ?? ?? 8D 04 43 50 FF 15 ?? ?? ?? ?? 83 C4 
            ?? 57 53 FF 15 ?? ?? ?? ?? 56 6A ?? 6A ?? 56 56 68 ?? ?? ?? ?? 53 FF 15 ?? ?? ?? ?? 
            89 45 ?? 83 F8 ?? 0F 84 ?? ?? ?? ?? 56 8D 4D ?? 51 FF 75 ?? FF 75 ?? 50 FF 15 ?? ?? 
            ?? ?? 85 C0 0F 84 ?? ?? ?? ?? 8B 45 ?? 3B 45 ?? 0F 85 ?? ?? ?? ?? 56 8D 45 ?? 50 57 
            8D 45 ?? 50 FF 75 ?? FF 15 ?? ?? ?? ?? 85 C0 74 ?? 39 7D ?? 75 ?? FF 75 ?? C7 45 ?? 
            ?? ?? ?? ?? FF 15 ?? ?? ?? ?? FF 75 ?? 53 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 68 ?? ?? ?? 
            ?? 6A ?? FF 15 ?? ?? ?? ?? 8B F8 3B FE 74 ?? 56 6A ?? 57 56 FF 15 ?? ?? ?? ?? 85 C0 
            74 ?? FF 75 ?? 68 ?? ?? ?? ?? 57 FF 15 ?? ?? ?? ?? 8D 04 47 50 FF 15 ?? ?? ?? ?? 83 
            C4 ?? 56 57 53 FF 15 ?? ?? ?? ?? 57 FF 15 ?? ?? ?? ?? EB ?? FF 75 ?? FF 15 ?? ?? ?? 
            ?? FF 75 ?? FF 15 ?? ?? ?? ?? FF 75 ?? FF 15 ?? ?? ?? ?? FF 75 ?? FF 15 ?? ?? ?? ?? 
            5F 8B 45 ?? 8B 08 50 FF 51 ?? 53 FF 15 ?? ?? ?? ?? 8B 45 ?? 5E 5B 83 C5 ?? C9 C2
        }

        $enumerate_resources = {
            55 8B EC 83 EC ?? 8D 45 ?? 50 FF 75 ?? 6A ?? 6A ?? 6A ?? E8 ?? ?? ?? ?? 85 C0 0F 85 
            ?? ?? ?? ?? 53 8B 1D ?? ?? ?? ?? 56 57 BE ?? ?? ?? ?? 56 6A ?? FF D3 8B F8 89 7D ?? 
            85 FF [2-8] 83 4D ?? ?? 8D 45 ?? 50 57 8D 45 ?? 50 FF 75 ?? 89 75 ?? E8 
            ?? ?? ?? ?? 85 C0 75 ?? 39 45 ?? 74 ?? 8D 77 ?? F6 46 ?? ?? 74 ?? 8D 46 ?? 50 [0-3] 
            E8 ?? ?? ?? ?? EB ?? 83 7E ?? ?? 75 ?? FF 36 FF 15 ?? ?? ?? ?? 8D 44 00 ?? 50 6A 
            ?? FF D3 8B F8 85 FF 74 ?? FF 36 57 FF 15 ?? ?? ?? ?? [0-5] 57 E8 ?? ?? ?? 
            ?? 57 FF 15 ?? ?? ?? ?? 83 C6 ?? FF 4D ?? 75 ?? 8B 7D ?? 57 FF 15 ?? ?? ?? ?? FF 75 
            ?? E8 ?? ?? ?? ?? 5F 5E 5B C9 C2 
        }

    condition:
        uint16(0) == 0x5A4D and 
        (($create_key_file and $create_lst_file and $enumerate_resources and $encrypt_files) or
        ($create_key and $enumerate_resources and $encrypt_files))
}
