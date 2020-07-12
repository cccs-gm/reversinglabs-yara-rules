rule Win32_Ransomware_Buran : tc_detection malicious
{
    meta:
        id = "4PqkFUMLvoDdvZ3O6g0Sfn"
        fingerprint = "7c1d5629312fc85bfbfa06ad5803f0f0e8f2798923b2a9f31a2bc48c3fb38f7c"
        version = "1.0"
        first_imported = "2020-07-11"
        last_modified = "2020-07-11"
        status = "RELEASED"
        sharing = "TLP:WHITE"
        source = "REVERSINGLABS"
        author = "ReversingLabs"
        description = "Yara rule that detects Buran ransomware."
        category = "MALWARE"
        malware = "BURAN"
        malware_type = "RANSOMWARE"
        tc_detection_type = "Ransomware"
        tc_detection_name = "Buran"
        tc_detection_factor = 5

    strings:

        $find_files = {
            55 8B EC 81 C4 ?? ?? ?? ?? 53 56 57 33 DB 89 9D ?? ?? ?? ?? 89 9D ?? ?? ?? ?? 89 9D 
            ?? ?? ?? ?? 89 9D ?? ?? ?? ?? 89 9D ?? ?? ?? ?? 89 9D ?? ?? ?? ?? 89 9D ?? ?? ?? ?? 
            89 5D ?? 89 5D ?? 88 8D ?? ?? ?? ?? 88 95 ?? ?? ?? ?? 89 45 ?? 8D 45 ?? E8 ?? ?? ?? 
            ?? 8D 85 ?? ?? ?? ?? 8B 15 ?? ?? ?? ?? E8 ?? ?? ?? ?? 33 C0 55 68 ?? ?? ?? ?? 64 FF 
            30 64 89 20 33 C0 55 68 ?? ?? ?? ?? 64 FF 30 64 89 20 8D 55 ?? 8B 45 ?? E8 ?? ?? ?? 
            ?? 8B 55 ?? A1 ?? ?? ?? ?? E8 ?? ?? ?? ?? 84 C0 74 ?? 80 BD ?? ?? ?? ?? ?? 75 ?? 33 
            C0 5A 59 59 64 89 10 E9 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? B8 ?? ?? ?? ?? E8 ?? ?? ?? ?? 
            8B 95 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 8D ?? ?? ?? ?? 8D 85 ?? ?? ?? 
            ?? 8B 55 ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 8D 8D ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? 
            ?? ?? ?? 85 C0 0F 85 ?? ?? ?? ?? 33 C0 55 68 ?? ?? ?? ?? 64 FF 30 64 89 20 8D 45 ?? 
            8B 8D ?? ?? ?? ?? 8B 55 ?? E8 ?? ?? ?? ?? 8B 55 ?? A1 ?? ?? ?? ?? E8 ?? ?? ?? ?? 84 
            C0 75 ?? 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 55 ?? A1 ?? ?? ?? ?? E8 ?? ?? ?? ?? 84 C0 
            74 ?? 80 BD ?? ?? ?? ?? ?? 74 ?? 33 C9 8B 55 ?? A1 ?? ?? ?? ?? E8 ?? ?? ?? ?? 68 ?? 
            ?? ?? ?? E8 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? E8 ?? ?? ?? ?? 85 C0 74 ?? 33 C0 5A 59 59 
            64 89 10 68 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? E8 ?? ?? ?? ?? C3 E9 
        }

        $encrypt_files = {
            53 56 57 55 BB ?? ?? ?? ?? BF ?? ?? ?? ?? 80 7B ?? ?? 75 ?? 83 3F ?? 74 ?? 8B 07 89 
            C6 33 C0 89 07 FF D6 83 3F ?? 75 ?? 83 3D ?? ?? ?? ?? ?? 74 ?? E8 ?? ?? ?? ?? E8 ?? 
            ?? ?? ?? 33 C0 A3 ?? ?? ?? ?? 80 7B ?? ?? 75 ?? 83 3D ?? ?? ?? ?? ?? 75 ?? 33 C0 89 
            43 ?? E8 ?? ?? ?? ?? 80 7B ?? ?? 76 ?? 83 3D ?? ?? ?? ?? ?? 74 ?? 8B 7B ?? 85 FF 74 
            ?? 8B C7 E8 ?? ?? ?? ?? 8B 6B ?? 8B 75 ?? 3B 75 ?? 74 ?? 85 F6 74 ?? 56 E8 ?? ?? ?? 
            ?? E8 ?? ?? ?? ?? 80 7B ?? ?? 75 ?? FF 53 ?? 80 7B ?? ?? 74 ?? E8 ?? ?? ?? ?? 83 3B 
            ?? 75 ?? 83 3D ?? ?? ?? ?? ?? 74 ?? FF 15 ?? ?? ?? ?? A1 ?? ?? ?? ?? 50 E8 ?? ?? ?? 
            ?? 8B 03 8B F0 8B FB B9 ?? ?? ?? ?? F3 A5 E9 ?? ?? ?? ?? 5D 5F 5E 5B C3 A3
        }

        $remote_connection_p1 = {
            55 8B EC 81 C4 ?? ?? ?? ?? 50 83 C4 ?? 53 56 33 DB 89 9D ?? ?? ?? ?? 89 9D ?? ?? ?? 
            ?? 89 9D ?? ?? ?? ?? 89 9D ?? ?? ?? ?? 89 9D ?? ?? ?? ?? 89 5D ?? 8B D9 89 55 ?? 89 
            45 ?? 8B 45 ?? E8 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 33 C0 55 68 ?? ?? ?? ?? 64 FF 
            30 64 89 20 8B C3 E8 ?? ?? ?? ?? 6A ?? 6A ?? 6A ?? 6A ?? 6A ?? E8 ?? ?? ?? ?? 89 45 
            ?? 83 7D ?? ?? 0F 84 ?? ?? ?? ?? 33 C0 55 68 ?? ?? ?? ?? 64 FF 30 64 89 20 BE ?? ?? 
            ?? ?? 6A ?? 6A ?? 6A ?? 6A ?? 6A ?? 56 8D 95 ?? ?? ?? ?? B8 ?? ?? ?? ?? E8 ?? ?? ?? 
            ?? 8B 85 ?? ?? ?? ?? E8 ?? ?? ?? ?? 50 8B 45 ?? 50 E8 ?? ?? ?? ?? 89 45 ?? 83 7D ?? 
            ?? 0F 84 ?? ?? ?? ?? 33 C0 55 68 ?? ?? ?? ?? 64 FF 30 64 89 20 8D 55 ?? B8 ?? ?? ?? 
            ?? E8 ?? ?? ?? ?? BE ?? ?? ?? ?? 6A ?? 56 6A ?? 6A ?? 6A ?? 8B 45 ?? E8
        }

        $remote_connection_p2 = { 
            50 8B 45 ?? E8 ?? ?? ?? ?? 50 8B 45 ?? 50 E8 ?? ?? ?? ?? 89 45 ?? 83 7D ?? ?? 0F 84 
            ?? ?? ?? ?? 33 C0 55 68 ?? ?? ?? ?? 64 FF 30 64 89 20 33 C9 B2 ?? A1 ?? ?? ?? ?? E8 
            ?? ?? ?? ?? 89 45 ?? 33 C0 55 68 ?? ?? ?? ?? 64 FF 30 64 89 20 8D 95 ?? ?? ?? ?? B8 
            ?? ?? ?? ?? E8 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 95 ?? 
            ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? B8 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8D 
            85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 95 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? 
            ?? 8D 95 ?? ?? ?? ?? B8 ?? ?? ?? ?? E8 ?? ?? ?? ?? FF B5 ?? ?? ?? ?? FF 75 ?? 68 ?? 
            ?? ?? ?? 8D 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 95 ?? ?? ?? ?? 8B 45 ?? 
            E8 ?? ?? ?? ?? 8B 45 ?? 8B 70 ?? 85 F6 74 ?? 83 EE ?? 8B 36 68 ?? ?? ?? ?? 56 8B 45 
            ?? 8B 40 ?? E8 ?? ?? ?? ?? 50 8B 45 ?? 50 E8 ?? ?? ?? ?? 6A ?? 6A ?? 6A ?? 6A ?? 8B 
            45 ?? 50 E8 ?? ?? ?? ?? 85 C0 0F 84 ?? ?? ?? ?? B2 ?? A1 ?? ?? ?? ?? E8 ?? ?? ?? ?? 
            89 45 ?? 33 C0 55 68 ?? ?? ?? ?? 64 FF 30 64 89 20 EB ?? 83 7D ?? ?? 74 ?? 8D 95 ?? 
            ?? ?? ?? 8B 4D ?? 8B 45 ?? 8B 30 FF 56 ?? 8D 45 ?? 50 68 ?? ?? ?? ?? 8D 85 ?? ?? ?? 
            ?? 50 8B 45 ?? 50 E8 ?? ?? ?? ?? 85 C0 75 ?? C6 85 ?? ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 
            B9 ?? ?? ?? ?? 8B 45 ?? 8B 30 FF 56 ?? 8B C3 8B 55 ?? 8B 52 ?? E8 ?? ?? ?? ?? 33 C0 
            5A 59 59 64 89 10 68 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? C3 E9 
        }

    condition:
        uint16(0) == 0x5A4D and 
        (
            $find_files
        ) and 
        (
            $encrypt_files
        ) and 
        (
            all of ($remote_connection_p*)
        )
}
