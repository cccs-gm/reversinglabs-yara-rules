rule Win32_Ransomware_CryptoFortress : tc_detection malicious
{
    meta:
        id = "2yeWjKOJ0bO1wYNrz4b6Do"
        fingerprint = "c698eb6c96a31a355c500e049eb62cc83ba5c0b7fe4d7fde89a445f4689fbfc6"
        version = "1.0"
        first_imported = "2020-07-11"
        last_modified = "2020-07-11"
        status = "RELEASED"
        sharing = "TLP:WHITE"
        source = "REVERSINGLABS"
        author = "ReversingLabs"
        description = "Yara rule that detects CryptoFortress ransomware."
        category = "MALWARE"
        malware = "CRYPTOFORTRESS"
        malware_type = "RANSOMWARE"
        tc_detection_type = "Ransomware"
        tc_detection_name = "CryptoFortress"
        tc_detection_factor = 5

    strings:

        $enum_drives = {
            55 8B EC 83 C4 ?? 56 57 C7 45 ?? ?? ?? ?? ?? C7 05 ?? ?? ?? ?? ?? ?? ?? ?? FF 15 ?? 
            ?? ?? ?? 8D 7D ?? B2 ?? B9 ?? ?? ?? ?? A9 ?? ?? ?? ?? 74 ?? 88 17 47 D1 E8 FE C2 49 
            75 ?? C6 07 ?? 8D 45 ?? 50 E8 ?? ?? ?? ?? 8B F8 8D 75 ?? 8A 16 88 55 ?? 8D 45 ?? 50 
            FF 15 ?? ?? ?? ?? 8D 55 ?? C6 42 ?? ?? 83 F8 ?? 75 ?? 60 8D 45 ?? 50 8D 45 ?? 50 6A 
            ?? 8D 45 ?? 50 FF 15 ?? ?? ?? ?? 8D 45 ?? 50 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8D 45 ?? 
            50 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? FF 05 ?? ?? ?? ?? 61 46 4F 75 ?? A1 ?? ?? ?? ?? A3 
            ?? ?? ?? ?? A1 ?? ?? ?? ?? A3 ?? ?? ?? ?? 68 ?? ?? ?? ?? 68 ?? ?? ?? ?? E8 ?? ?? ?? 
            ?? 5F 5E C9 C3 
        }

        $enum_shared_resources = {
            55 8B EC 83 C4 ?? 8D 45 ?? 50 FF 75 ?? 6A ?? 6A ?? 6A ?? FF 15 ?? ?? ?? ?? 0B C0 0F 
            85 ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? 68 ?? ?? ?? ?? 6A ?? FF 35 ?? ?? ?? ?? E8 ?? ?? 
            ?? ?? 89 45 ?? C7 45 ?? ?? ?? ?? ?? 8D 45 ?? 50 FF 75 ?? 8D 45 ?? 50 FF 75 ?? FF 15 
            ?? ?? ?? ?? 83 7D ?? ?? 74 ?? 3D ?? ?? ?? ?? 74 ?? 8B 4D ?? 51 8D 49 ?? 6B C9 ?? 8B 
            45 ?? 8D 0C 01 6A ?? 51 8D 45 ?? 50 E8 ?? ?? ?? ?? 83 7D ?? ?? 75 ?? FF 75 ?? E8 ?? 
            ?? ?? ?? 83 F8 ?? 76 ?? FF 75 ?? FF 15 ?? ?? ?? ?? 50 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 
            0B C0 74 ?? FF 75 ?? E8 ?? ?? ?? ?? EB ?? 8D 45 ?? 50 E8 ?? ?? ?? ?? 59 49 75 ?? EB 
            ?? EB ?? E9 ?? ?? ?? ?? FF 75 ?? 6A ?? FF 35 ?? ?? ?? ?? E8 ?? ?? ?? ?? FF 75 ?? FF 
            15 ?? ?? ?? ?? C9 C2 
        }

        $find_files = {
            55 8B EC 81 C4 ?? ?? ?? ?? FF 35 ?? ?? ?? ?? E8 ?? ?? ?? ?? 89 85 ?? ?? ?? ?? FF 35 
            ?? ?? ?? ?? E8 ?? ?? ?? ?? 89 85 ?? ?? ?? ?? FF 35 ?? ?? ?? ?? E8 ?? ?? ?? ?? 89 85 
            ?? ?? ?? ?? FF 35 ?? ?? ?? ?? E8 ?? ?? ?? ?? 89 85 ?? ?? ?? ?? FF 35 ?? ?? ?? ?? E8 
            ?? ?? ?? ?? 89 85 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 FF B5 ?? ?? ?? ?? FF 15 ?? ?? ?? 
            ?? 40 0F 84 ?? ?? ?? ?? 48 89 85 ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 
            83 E0 ?? 0F 84 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 85 C0 
            0F 84 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 85 C0 0F 84 ?? 
            ?? ?? ?? FF B5 ?? ?? ?? ?? FF B5 ?? ?? ?? ?? E8 ?? ?? ?? ?? FF B5 ?? ?? ?? ?? FF 15 
            ?? ?? ?? ?? C6 00 ?? 8D 85 ?? ?? ?? ?? 50 FF B5 ?? ?? ?? ?? E8 ?? ?? ?? ?? FF B5 ?? 
            ?? ?? ?? 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 85 C0 0F 84 ?? ?? ?? ?? FF B5 ?? ?? ?? ?? FF 
            15 ?? ?? ?? ?? C6 00 ?? 2B 85 ?? ?? ?? ?? 50 8D 85 ?? ?? ?? ?? 50 FF B5 ?? ?? ?? ?? 
            E8 ?? ?? ?? ?? FF B5 ?? ?? ?? ?? E8 ?? ?? ?? ?? FF B5 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 
            8D ?? ?? ?? ?? C7 04 08 ?? ?? ?? ?? E8 ?? ?? ?? ?? 58 8B 8D ?? ?? ?? ?? C7 44 08 ?? 
            ?? ?? ?? ?? E9 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 85 C0 
            0F 84 ?? ?? ?? ?? FF B5 ?? ?? ?? ?? E8 ?? ?? ?? ?? 50 FF B5 ?? ?? ?? ?? FF B5 ?? ?? 
            ?? ?? E8 ?? ?? ?? ?? 68 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 FF 15 ?? ?? ?? ?? 85 C0 0F 
            85 ?? ?? ?? ?? 8B 4D ?? 0B C9 75 ?? 6A ?? FF B5 ?? ?? ?? ?? E8 ?? ?? ?? ?? FF 45 ?? 
            8D 85 ?? ?? ?? ?? 50 FF B5 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 68 ?? ?? 
            ?? ?? E8 ?? ?? ?? ?? 85 C0 0F 84 ?? ?? ?? ?? 68 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 FF 
            15 ?? ?? ?? ?? 85 C0 0F 85 ?? ?? ?? ?? 8B 0D ?? ?? ?? ?? 49 8B 1D ?? ?? ?? ?? 51 53 
            FF B5 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 83 F8 ?? 75 ?? 59 EB ?? 53 E8 ?? ?? ?? ?? 03 D8 
            83 C3 ?? 59 E2 ?? A1 ?? ?? ?? ?? 85 C0 74 ?? 8B 8D ?? ?? ?? ?? 8B 95 ?? ?? ?? ?? 0B 
            C9 75 ?? 3B D0 72 ?? EB ?? EB ?? FF B5 ?? ?? ?? ?? FF B5 ?? ?? ?? ?? E8 ?? ?? ?? ?? 
            FF B5 ?? ?? ?? ?? E8 ?? ?? ?? ?? 0B C0 75 ?? FF B5 ?? ?? ?? ?? FF B5 ?? ?? ?? ?? E8 
            ?? ?? ?? ?? 68 ?? ?? ?? ?? FF B5 ?? ?? ?? ?? E8 ?? ?? ?? ?? FF 35 ?? ?? ?? ?? FF B5 
            ?? ?? ?? ?? E8 ?? ?? ?? ?? FF B5 ?? ?? ?? ?? FF B5 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 8D 
            85 ?? ?? ?? ?? 50 FF B5 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 85 C0 0F 85 ?? ?? ?? ?? FF B5 
            ?? ?? ?? ?? FF 15 ?? ?? ?? ?? C9 C3 
        }

        $encrypt_files = {
            55 8B EC 83 C4 ?? 53 33 C0 89 45 ?? 89 45 ?? 89 45 ?? 89 45 ?? 89 45 ?? 89 45 ?? 89 
            45 ?? 89 45 ?? 89 45 ?? 89 45 ?? 89 45 ?? 89 45 ?? 89 45 ?? FF 35 ?? ?? ?? ?? E8 ?? 
            ?? ?? ?? 89 45 ?? FF 75 ?? E8 ?? ?? ?? ?? 33 C0 50 50 6A ?? 50 6A ?? 68 ?? ?? ?? ?? 
            FF 75 ?? FF 15 ?? ?? ?? ?? 83 F8 ?? 75 ?? E9 ?? ?? ?? ?? 89 45 ?? 8D 45 ?? 50 8D 45 
            ?? 50 8D 45 ?? 50 FF 75 ?? FF 15 ?? ?? ?? ?? 8D 45 ?? 50 FF 75 ?? FF 15 ?? ?? ?? ?? 
            83 7D ?? ?? 75 ?? 83 7D ?? ?? 73 ?? E9 ?? ?? ?? ?? 8B 55 ?? 8B 4D ?? BB ?? ?? ?? ?? 
            B8 ?? ?? ?? ?? E8 ?? ?? ?? ?? 0F B6 05 ?? ?? ?? ?? E8 ?? ?? ?? ?? BB ?? ?? ?? ?? B8 
            ?? ?? ?? ?? E8 ?? ?? ?? ?? 0B D2 75 ?? 0B C9 75 ?? B9 ?? ?? ?? ?? 89 4D ?? 89 55 ?? 
            B8 ?? ?? ?? ?? E8 ?? ?? ?? ?? 89 4D ?? 89 55 ?? BB ?? ?? ?? ?? B8 ?? ?? ?? ?? E8 ?? 
            ?? ?? ?? 89 4D ?? 89 55 ?? 0B DB 75 ?? 0B C0 74 ?? 83 45 ?? ?? 83 55 ?? ?? FF 75 ?? 
            FF 75 ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? 83 7D ?? ?? 77 ?? 81 7D ?? ?? ?? 
            ?? ?? 76 ?? B8 ?? ?? ?? ?? EB ?? 8B 45 ?? 6B C0 ?? 89 45 ?? 6A ?? 8D 45 ?? 50 FF 75 
            ?? FF 75 ?? E8 ?? ?? ?? ?? 83 F8 ?? 75 ?? E8 ?? ?? ?? ?? 0B C0 74 ?? E9 ?? ?? ?? ?? 
            6A ?? 8D 45 ?? 50 FF 75 ?? FF 75 ?? FF 75 ?? FF 15 ?? ?? ?? ?? 0B C0 75 ?? E9 ?? ?? 
            ?? ?? 68 ?? ?? ?? ?? 8D 45 ?? 50 FF 75 ?? 6A ?? 6A ?? 6A ?? FF 35 ?? ?? ?? ?? FF 15 
            ?? ?? ?? ?? 0B C0 75 ?? E9 ?? ?? ?? ?? 6A ?? 8D 45 ?? 50 FF 75 ?? FF 75 ?? E8 ?? ?? 
            ?? ?? 83 F8 ?? 75 ?? E8 ?? ?? ?? ?? 0B C0 74 ?? E9 ?? ?? ?? ?? 6A ?? 8D 45 ?? 50 FF 
            75 ?? FF 75 ?? FF 75 ?? FF 15 ?? ?? ?? ?? 0B C0 75 ?? E9 ?? ?? ?? ?? DF 6D ?? DA 45 
            ?? DF 7D ?? C7 45 ?? ?? ?? ?? ?? DF 6D ?? DA 65 ?? DF 7D ?? C7 45 ?? ?? ?? ?? ?? DF 
            6D ?? DA 65 ?? DF 7D ?? 83 7D ?? ?? 75 ?? 83 7D ?? ?? 74 ?? E9 ?? ?? ?? ?? 8F 45 ?? 
            8F 45 ?? 6A ?? 8D 45 ?? 50 FF 75 ?? FF 75 ?? E8 ?? ?? ?? ?? 83 F8 ?? 75 ?? E8 ?? ?? 
            ?? ?? 0B C0 74 ?? EB ?? 6A ?? 8D 45 ?? 50 6A ?? 8D 45 ?? 50 FF 75 ?? FF 15 ?? ?? ?? 
            ?? 0B C0 75 ?? EB ?? 6A ?? 8D 45 ?? 50 6A ?? 68 ?? ?? ?? ?? FF 75 ?? FF 15 ?? ?? ?? 
            ?? 0B C0 75 ?? EB ?? EB ?? 8D 45 ?? 50 8D 45 ?? 50 8D 45 ?? 50 FF 75 ?? FF 15 ?? ?? 
            ?? ?? FF 75 ?? E8 ?? ?? ?? ?? B8 ?? ?? ?? ?? EB ?? 8D 45 ?? 50 8D 45 ?? 50 8D 45 ?? 
            50 FF 75 ?? FF 15 ?? ?? ?? ?? FF 75 ?? E8 ?? ?? ?? ?? B8 ?? ?? ?? ?? 5B C9 C2  
        }

        $read_config_file = {
            55 8B EC 83 C4 ?? [0-20] 6A ?? 68 ?? ?? ?? ?? 6A 
            ?? (E8 | FF 15) ?? ?? ?? ?? 0B C0 75 ?? 33 C0 C9 
            C3 89 45 ?? 50 6A ?? (E8 | FF 15) ?? ?? ?? ?? 0B 
            C0 75 04 33 C0 C9 C3 89 45 ?? FF 75 ?? 6A ?? 
            (E8 | FF 15) ?? ?? ?? ?? 0B C0 75 04 33 C0 C9 C3 
            89 45 ?? 50 (E8 | FF 15) ?? ?? ?? ?? 0B C0 75 04 
            33 C0 C9 C3 89 45 ?? FF 75 ?? 6A ?? (E8 | FF 15) 
            ?? ?? ?? ?? 0B C0 75 04 33 C0 C9 C3 89 45 ?? 8B 
            D8 FF 75 ?? FF 75 ?? FF 75 ?? (E8 | FF 15) ?? ?? 
            ?? ?? FF 75 ?? (E8 | FF 15) ?? ?? ?? ?? 8B 5D ?? 
            6A ?? 53 68 ?? ?? ?? ?? (E8 | FF 15) ?? ?? ?? ?? 
            83 C3 ?? 8B 45 ?? 83 (E8 | FF 15) ?? 50 53 
            (E8 | FF 15) ?? ?? ?? ?? 8A 03 A2 ?? ?? ?? ?? 83 
            C3 ?? 8A 03 A2 ?? ?? ?? ?? 83 C3 
        }

        $file_type_loop = {
            51 53 FF B5 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 83 F8 
            ?? 75 03 59 EB ?? 53 E8 ?? ?? ?? ?? 03 D8 83 C3 
            ?? 59 E2 DC [20-40] FF B5 ?? ?? ?? ?? FF B5 ?? 
            ?? ?? ?? E8 ?? ?? ?? ?? FF B5 ?? ?? ?? ?? E8 ?? 
            ?? ?? ?? 0B C0 75 44 FF B5 ?? ?? ?? ?? FF B5 ?? 
            ?? ?? ?? E8 ?? ?? ?? ?? 68 ?? ?? ?? ?? FF B5 ?? 
            ?? ?? ?? E8 ?? ?? ?? ?? FF 35 ?? ?? ?? ?? FF B5 
            ?? ?? ?? ?? E8 ?? ?? ?? ?? FF B5 ?? ?? ?? ?? FF 
            B5 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 8D 85 ?? ?? ?? 
            ?? 50 FF B5 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 85 C0 
            0F 85 
        }

        $encrypt_routine = {
            FF 75 ?? FF 75 ?? E8 ?? ?? ?? ?? 83 F8 ?? 75 ?? 
            [0-10] E9 ?? ?? ?? ?? 6A ?? [1-10] FF 75 ?? 
            FF (35 | 75) [1-4] FF 75 ?? (E8 | FF 15) 
            ?? ?? ?? ?? 0B C0 75 ?? E9 ?? ?? ?? ?? 68 ?? 
            ?? ?? ?? [1-10] FF (35 | 75) [1-4] 6A ?? 
            6A ?? 6A ?? FF 35 ?? ?? ?? ?? (E8 | FF 15) ?? 
            ?? ?? ?? 0B C0 75 ?? (EB | E9) [1-4] 6A ?? 
            [2-10] FF 75 ?? FF 75 ?? E8 ?? ?? ?? ?? 83 F8 
            ?? 75 ?? [10-40] FF (35 | 75) [1-4] FF 75 ?? 
            (E8 |FF 15)
        }

    condition:
        uint16(0) == 0x5A4D and
        (
            (
                $read_config_file and
                $file_type_loop and
                $encrypt_routine
            ) or
            (
                $enum_drives and
                $enum_shared_resources and
                $find_files and
                $encrypt_files
            )
        )
}
