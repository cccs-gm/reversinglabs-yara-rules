rule Win32_Ransomware_Magniber : tc_detection malicious
{
    meta:
        id = "6pXKb1I8mTkOm1sepTge0o"
        fingerprint = "41fd4faf439507939753f5e93f53a1b4abce9c8c50f32975b433073bf2948c7f"
        version = "1.0"
        first_imported = "2020-07-11"
        last_modified = "2020-07-11"
        status = "RELEASED"
        sharing = "TLP:WHITE"
        source = "REVERSINGLABS"
        author = "ReversingLabs"
        description = "Yara rule that detects Magniber ransomware."
        category = "MALWARE"
        malware = "MAGNIBER"
        malware_type = "RANSOMWARE"
        tc_detection_type = "Ransomware"
        tc_detection_name = "Magniber"
        tc_detection_factor = 5

    strings:

        $remote_connection = {
            E8 ?? ?? ?? ?? 83 C4 ?? 68 ?? ?? ?? ?? 8D 8D ?? ?? ?? ?? 51 FF 15 ?? ?? ?? ?? 8B 55 
            ?? 52 8D 85 ?? ?? ?? ?? 50 FF 15 ?? ?? ?? ?? 68 ?? ?? ?? ?? 8D 8D ?? ?? ?? ?? 51 FF 
            15 ?? ?? ?? ?? 8B 55 ?? 52 8D 85 ?? ?? ?? ?? 50 FF 15 ?? ?? ?? ?? 68 ?? ?? ?? ?? 8D 
            8D ?? ?? ?? ?? 51 FF 15 ?? ?? ?? ?? 8B 55 ?? 52 8D 85 ?? ?? ?? ?? 50 FF 15 ?? ?? ?? 
            ?? 6A ?? 6A ?? 6A ?? 6A ?? 6A ?? FF 15 ?? ?? ?? ?? 89 45 ?? 6A ?? 6A ?? 6A ?? 6A ?? 
            8D 8D ?? ?? ?? ?? 51 8B 55 ?? 52 FF 15 ?? ?? ?? ?? 89 45 ?? C7 45 ?? ?? ?? ?? ?? 6A 
            ?? 8D 45 ?? 50 8D 4D ?? 51 68 ?? ?? ?? ?? 8B 55 ?? 52 FF 15 ?? ?? ?? ?? 83 7D ?? ?? 
            74 ?? 8B 45 ?? 50 FF 15 ?? ?? ?? ?? 8B 4D ?? 51 FF 15 ?? ?? ?? ?? 33 C0 E9 ?? ?? ?? 
            ?? 8B 55 ?? 83 C2 ?? 52 6A ?? FF 15 ?? ?? ?? ?? 50 FF 15 ?? ?? ?? ?? 89 45 ?? 83 7D 
            ?? ?? 75 ?? 8B 45 ?? 50 FF 15 ?? ?? ?? ?? 8B 4D ?? 51 FF 15 ?? ?? ?? ?? 33 C0 EB ?? 
            C7 45 ?? ?? ?? ?? ?? 8D 55 ?? 52 8B 45 ?? 50 8B 4D ?? 51 8B 55 ?? 52 FF 15 ?? ?? ?? 
            ?? 8B 45 ?? 50 FF 15 ?? ?? ?? ?? 8B 4D ?? 51 FF 15
        }

        $encrypt_files_1 = {
            55 8B EC 83 EC ?? 56 C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? 
            C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? 
            C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? 8B 45 ?? 50 FF 15 ?? 
            ?? ?? ?? 89 45 ?? 8B 4D ?? 51 FF 15 ?? ?? ?? ?? 89 45 ?? 8B 55 ?? 03 55 ?? 8D 44 12 
            ?? 50 6A ?? FF 15 ?? ?? ?? ?? 50 FF 15 ?? ?? ?? ?? 89 45 ?? C7 45 ?? ?? ?? ?? ?? EB 
            ?? 8B 4D ?? 83 C1 ?? 89 4D ?? 8B 55 ?? 3B 55 ?? 7D ?? 8B 45 ?? 8B 4D ?? 8B 55 ?? 8B 
            75 ?? 66 8B 14 56 66 89 14 41 EB ?? B8 ?? ?? ?? ?? 8B 4D ?? 8B 55 ?? 66 89 04 4A C7 
            45 ?? ?? ?? ?? ?? EB ?? 8B 45 ?? 83 C0 ?? 89 45 ?? 8B 4D ?? 3B 4D ?? 7D ?? 8B 55 ?? 
            03 55 ?? 8B 45 ?? 8B 4D ?? 8B 75 ?? 66 8B 0C 4E 66 89 4C 50 ?? EB ?? 8B 55 ?? 03 55 
            ?? 33 C0 8B 4D ?? 66 89 44 51 ?? 8D 55 ?? 52 8D 45 ?? 50 8D 4D ?? 51 8B 55 ?? 52 8B
        }

        $encrypt_files_2 = {
            45 ?? 50 E8 ?? ?? ?? ?? 83 C4 ?? 89 45 ?? 83 7D ?? ?? 0F 84 ?? ?? ?? ?? 6A ?? 68 ?? 
            ?? ?? ?? 6A ?? 6A ?? 6A ?? 68 ?? ?? ?? ?? 8B 4D ?? 51 FF 15 ?? ?? ?? ?? 89 45 ?? 83 
            7D ?? ?? 75 ?? 33 C0 E9 ?? ?? ?? ?? 8D 55 ?? 52 8B 45 ?? 50 FF 15 ?? ?? ?? ?? 85 C0 
            75 ?? 8B 4D ?? 51 FF 15 ?? ?? ?? ?? 33 C0 E9 ?? ?? ?? ?? 6A ?? 68 ?? ?? ?? ?? 6A ?? 
            6A ?? 6A ?? 68 ?? ?? ?? ?? 8B 55 ?? 52 FF 15 ?? ?? ?? ?? 89 45 ?? 83 7D ?? ?? 0F 84 
            ?? ?? ?? ?? 8B 45 ?? 83 C0 ?? 50 6A ?? FF 15 ?? ?? ?? ?? 50 FF 15 ?? ?? ?? ?? 89 45 
            ?? 83 7D ?? ?? 0F 84 ?? ?? ?? ?? 66 0F 57 C0 66 0F 13 45 ?? 6A ?? 8D 4D ?? 51 6A ?? 
            8B 55 ?? 52 8B 45 ?? 50 FF 15 ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? 8B 45 ?? 99 8B 4D ?? 
            2B 4D ?? 8B 75 ?? 1B 75 ?? 89 45 ?? 89 55 ?? 89 4D ?? 89 75 ?? 8B 55 ?? 3B 55 ?? 7C 
            ?? 7F ?? 8B 45 ?? 3B 45 ?? 76 ?? 8B 4D ?? 2B 4D ?? 8B 55 ?? 1B 55 ?? 89 4D ?? 89 55 
            ?? EB ?? 8B 45 ?? 99 89 45 ?? 89 55 ?? 6A ?? 8D 45 ?? 50 8B 4D ?? 51 8B 55 ?? 52 8B
        }

        $encrypt_files_3 = { 
            45 ?? 50 FF 15 ?? ?? ?? ?? 89 45 ?? 83 7D ?? ?? 75 ?? 33 C0 E9 ?? ?? ?? ?? 83 7D ?? 
            ?? 75 ?? E9 ?? ?? ?? ?? 8B 4D ?? 3B 4D ?? 73 ?? C7 45 ?? ?? ?? ?? ?? 8B 55 ?? 89 55 
            ?? 8B 45 ?? 50 8D 4D ?? 51 6A ?? 6A ?? 8B 55 ?? 52 6A ?? 8B 45 ?? 50 FF 15 ?? ?? ?? 
            ?? 89 45 ?? 83 7D ?? ?? 74 ?? 8B 4D ?? 51 8D 55 ?? 52 8B 45 ?? 50 6A ?? 8B 4D ?? 51 
            6A ?? 8B 55 ?? 52 FF 15 ?? ?? ?? ?? 6A ?? 8D 45 ?? 50 8B 4D ?? 51 8B 55 ?? 52 8B 45 
            ?? 50 FF 15 ?? ?? ?? ?? 8B 4D ?? 51 8B 55 ?? 52 E8 ?? ?? ?? ?? 83 C4 ?? EB ?? EB ?? 
            E9 ?? ?? ?? ?? 8B 45 ?? 50 6A ?? FF 15 ?? ?? ?? ?? 50 FF 15 ?? ?? ?? ?? 83 7D ?? ?? 
            74 ?? 8B 4D ?? 51 FF 15 ?? ?? ?? ?? 83 7D ?? ?? 74 ?? 8B 55 ?? 52 FF 15 ?? ?? ?? ?? 
            83 7D ?? ?? 74 ?? 6A ?? 8B 45 ?? 50 FF 15 ?? ?? ?? ?? 8D 4D ?? 51 8B 55 ?? 52 FF 15 
            ?? ?? ?? ?? 85 C0 0F 84 ?? ?? ?? ?? 8B 45 ?? 3B 45 ?? 7C ?? 7F ?? 8B 4D ?? 3B 4D ?? 
            76 ?? 83 7D ?? ?? 74 ?? 8B 55 ?? 52 FF 15 ?? ?? ?? ?? 8B 45 ?? 50 FF 15 ?? ?? ?? ?? 
            8B 4D ?? 51 6A ?? FF 15 ?? ?? ?? ?? 50 FF 15 ?? ?? ?? ?? 8B 55 ?? 52 E8 ?? ?? ?? ?? 
            83 C4 ?? B8 ?? ?? ?? ?? EB
        }

        $search_files = {
            C7 85 ?? ?? ?? ?? ?? ?? ?? ?? C7 85 ?? ?? ?? ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 
            45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 
            45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 
            45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 
            45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 
            45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 
            45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 
            45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 
            45 ?? ?? ?? ?? ?? EB ?? 8B 45 ?? 83 C0 ?? 89 45 ?? 83 7D ?? ?? 7D ?? 8B 4D ?? 8B 94 
            8D ?? ?? ?? ?? 52 8B 45 ?? 50 E8 ?? ?? ?? ?? 83 C4 ?? 85 C0 74 ?? 33 C0 E9 ?? ?? ?? 
            ?? EB ?? 8B 4D ?? 8B 55 ?? 8B 81 ?? ?? ?? ?? 3B 82 ?? ?? ?? ?? 76 ?? B8 ?? ?? ?? ?? 
            E9 ?? ?? ?? ?? 8B 4D ?? 51 E8 ?? ?? ?? ?? 83 C4 ?? 89 45 ?? 83 7D ?? ?? 75 ?? B8 ?? 
            ?? ?? ?? E9 ?? ?? ?? ?? 68 ?? ?? ?? ?? 8B 55 ?? 52 8D 85 ?? ?? ?? ?? 50 E8 ?? ?? ?? 
            ?? 83 C4 ?? 8B 8D ?? ?? ?? ?? 83 C1 ?? 89 8D ?? ?? ?? ?? 8B 55 ?? 52 E8 ?? ?? ?? ?? 
            83 C4 ?? 89 45 ?? 83 7D ?? ?? 0F 84 ?? ?? ?? ?? 68 ?? ?? ?? ?? 8B 45 ?? 83 C0 ?? 50 
            FF 15 ?? ?? ?? ?? 85 C0 74 ?? 68 ?? ?? ?? ?? 8B 4D ?? 83 C1 ?? 51 FF 15 ?? ?? ?? ?? 
            85 C0 75 ?? EB ?? 8B 55 ?? 52 8D 85 ?? ?? ?? ?? 50 FF 15 ?? ?? ?? ?? 8B 4D ?? 83 C1 
            ?? 51 8D 95 ?? ?? ?? ?? 52 FF 15 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? 83 
            C4 ?? 85 C0 74 ?? 8B 4D ?? 81 79 ?? ?? ?? ?? ?? 75 ?? 68 ?? ?? ?? ?? 8D 95 ?? ?? ?? 
            ?? 52 FF 15 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? 83 C4 ?? EB ?? 8B 4D ?? 
            81 79 ?? ?? ?? ?? ?? 75 ?? 8D 95 ?? ?? ?? ?? 52 8D 85 ?? ?? ?? ?? 50 8B 8D ?? ?? ?? 
            ?? 51 8D 95 ?? ?? ?? ?? 52 8D 85 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? 83 C4 ?? 03 45 ?? 89 
            45 ?? E9 ?? ?? ?? ?? 83 7D ?? ?? 74 ?? 6A ?? 8B 4D ?? 81 C1 ?? ?? ?? ?? 51 8B 55 ?? 
            81 C2 ?? ?? ?? ?? 52 8B 45 ?? 05 ?? ?? ?? ?? 50 8B 4D ?? 81 C1 ?? ?? ?? ?? 51 8B 55 
            ?? 81 C2 ?? ?? ?? ?? 52 8B 45 ?? 05 ?? ?? ?? ?? 50 8B 4D ?? 81 C1 ?? ?? ?? ?? 51 8B 
            55 ?? 52 E8 ?? ?? ?? ?? 83 C4 ?? 8B 45 ?? 50 E8
        }

    condition:
        uint16(0) == 0x5A4D and
        (
            $search_files and
            (all of ($encrypt_files_*)) and
            $remote_connection
        )
}
