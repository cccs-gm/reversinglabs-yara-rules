rule Win32_Ransomware_Nefilim : tc_detection malicious
{
    meta:
        id = "1hw6SqLtgzrNo7D2Gz2tqG"
        fingerprint = "3ee9f8f7d65cd9ae7e55dc84ad2dce08c596c9d5bbc0144b0396a26a0dd3a9f3"
        version = "1.0"
        first_imported = "2020-07-11"
        last_modified = "2020-07-11"
        status = "RELEASED"
        sharing = "TLP:WHITE"
        source = "REVERSINGLABS"
        author = "ReversingLabs"
        description = "Yara rule that detects Nefilim ransomware."
        category = "MALWARE"
        malware = "NEFILIM"
        malware_type = "RANSOMWARE"
        tc_detection_type = "Ransomware"
        tc_detection_name = "Nefilim"
        tc_detection_factor = 5

    strings:

        $create_encryption_key = {
            55 8B EC 51 A1 ?? ?? ?? ?? C1 E8 ?? 6B C0 ?? 56 50 E8 ?? ?? ?? ?? 83 3D ?? ?? ?? ?? 
            ?? 8B F0 A1 ?? ?? ?? ?? 59 89 75 ?? 73 ?? B8 ?? ?? ?? ?? FF 35 ?? ?? ?? ?? 50 E8 ?? 
            ?? ?? ?? 33 F6 59 59 39 35 ?? ?? ?? ?? 75 ?? 53 57 8B 3D ?? ?? ?? ?? 56 6A ?? 56 BE 
            ?? ?? ?? ?? 56 BB ?? ?? ?? ?? 53 FF D7 85 C0 75 ?? 6A ?? 6A ?? 50 56 53 FF D7 85 C0 
            75 ?? 50 FF 15 ?? ?? ?? ?? 5F 33 F6 5B A1 ?? ?? ?? ?? C1 E8 ?? 6B C0 ?? 68 ?? ?? ?? 
            ?? 56 56 50 FF 75 ?? FF 35 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 85 C0 75 ?? 56 EB ?? 5E C9 
            C3 
        }

        $encrypt_encryption_key = {
            55 8B EC 83 EC ?? A1 ?? ?? ?? ?? 33 C5 89 45 ?? 68 ?? ?? ?? ?? 8D 45 ?? 8D 4D ?? E8 
            ?? ?? ?? ?? 83 78 ?? ?? 59 72 ?? 8B 00 53 56 57 33 DB 53 53 6A ?? 53 53 68 ?? ?? ?? 
            ?? 50 FF 15 ?? ?? ?? ?? 6A ?? 33 FF 8D 75 ?? 89 45 ?? E8 ?? ?? ?? ?? 39 5D ?? 0F 84 
            ?? ?? ?? ?? 8B 1D ?? ?? ?? ?? BF ?? ?? ?? ?? 57 FF D3 99 83 E2 ?? 03 C2 C1 F8 ?? 6B 
            C0 ?? 50 6A ?? FF 15 ?? ?? ?? ?? 50 FF 15 ?? ?? ?? ?? 57 8B F0 FF D3 50 57 E8 ?? ?? 
            ?? ?? 59 59 57 FF D3 99 83 E2 ?? 03 C2 C1 F8 ?? 6B C0 ?? 89 45 ?? 8D 45 ?? 50 56 6A 
            ?? 6A ?? 6A ?? FF 35 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 6A ?? 85 C0 75 ?? FF 15 ?? ?? ?? 
            ?? 8D 45 ?? 50 57 FF D3 99 83 E2 ?? 03 C2 C1 F8 ?? 6B C0 ?? 50 56 FF 75 ?? FF 15 ?? 
            ?? ?? ?? FF 75 ?? FF 15 ?? ?? ?? ?? 56 6A ?? FF 15 ?? ?? ?? ?? 50 FF 15 ?? ?? ?? ?? 
            6A ?? 33 FF 8D 75 ?? E8 ?? ?? ?? ?? 8B 4D ?? 5F 5E 33 CD 5B E8 ?? ?? ?? ?? C9 C3 
        }

        $encrypt_files_p1 = {
            55 8B EC 83 E4 ?? 83 EC ?? A1 ?? ?? ?? ?? 33 C4 89 44 24 ?? 83 7D ?? ?? 8B 45 ?? 53 
            56 57 73 ?? 8D 45 ?? 33 DB 53 53 6A ?? 53 53 68 ?? ?? ?? ?? 50 FF 15 ?? ?? ?? ?? 89 
            44 24 ?? 3B C3 0F 84 ?? ?? ?? ?? 8D 4C 24 ?? 51 50 FF 15 ?? ?? ?? ?? A1 ?? ?? ?? ?? 
            6B C0 ?? 83 C0 ?? 83 F8 ?? 0F 8E ?? ?? ?? ?? 6A ?? E8 ?? ?? ?? ?? 6A ?? 89 44 24 ?? 
            E8 ?? ?? ?? ?? FF 74 24 ?? 89 44 24 ?? E8 ?? ?? ?? ?? FF 74 24 ?? E8 ?? ?? ?? ?? BE 
            ?? ?? ?? ?? 56 E8 ?? ?? ?? ?? 56 89 44 24 ?? E8 ?? ?? ?? ?? FF 74 24 ?? 8B 54 24 ?? 
            89 44 24 ?? E8 ?? ?? ?? ?? FF 74 24 ?? 8B 54 24 ?? E8 ?? ?? ?? ?? 83 C4 ?? FF 15 ?? 
            ?? ?? ?? 83 3D ?? ?? ?? ?? ?? 7E ?? 68 ?? ?? ?? ?? 8D 74 24 ?? E8 ?? ?? ?? ?? 6A ?? 
            33 FF E8 ?? ?? ?? ?? BE ?? ?? ?? ?? 8B 3D ?? ?? ?? ?? 53 53 FF 74 24 ?? FF 74 24 ?? 
            FF 74 24 ?? FF D7 53 FF 15 ?? ?? ?? ?? 53 8D 44 24 ?? 50 56 FF 74 24 ?? FF 74 24 ?? 
            FF 15 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 83 F8 ?? 0F 84 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 83 
            F8 ?? 0F 84 ?? ?? ?? ?? 8B 44 24 ?? 8B 4C 24 ?? 53 03 C6 53 13 CB 51 50 FF 74 24 ?? 
            FF D7 53 8D 44 24 ?? 50 56 FF 74 24 ?? FF 74 24 ?? FF 15 ?? ?? ?? ?? 8B 44 24 ?? 8B
        }

        $encrypt_files_p2 = { 
            4C 24 ?? 53 05 ?? ?? ?? ?? 53 13 CB 51 50 FF 74 24 ?? FF D7 53 E8 ?? ?? ?? ?? 0B C2 
            59 74 ?? 68 ?? ?? ?? ?? 8D 44 24 ?? E8 ?? ?? ?? ?? 6A ?? 33 FF 8D 74 24 ?? E8 ?? ?? 
            ?? ?? 8B 3D ?? ?? ?? ?? 53 8D 44 24 ?? 50 FF 35 ?? ?? ?? ?? FF 35 ?? ?? ?? ?? FF 74 
            24 ?? FF 15 ?? ?? ?? ?? 8B 44 24 ?? 8B 4C 24 ?? 3B C3 0F 8C ?? ?? ?? ?? 7F ?? 81 F9 
            ?? ?? ?? ?? 0F 86 ?? ?? ?? ?? 89 5C 24 ?? 89 5C 24 ?? 3B C3 0F 8C ?? ?? ?? ?? 7F ?? 
            3B CB 0F 86 ?? ?? ?? ?? BE ?? ?? ?? ?? EB ?? 8B 4C 24 ?? 2B 4C 24 ?? 1B 44 24 ?? 89 
            44 24 ?? 0F 88 ?? ?? ?? ?? 7F ?? 81 F9 ?? ?? ?? ?? 0F 82 ?? ?? ?? ?? 56 53 FF 15 ?? 
            ?? ?? ?? 50 FF 15 ?? ?? ?? ?? 53 53 FF 74 24 ?? 89 44 24 ?? FF 74 24 ?? FF 74 24 ?? 
            FF D7 53 8D 44 24 ?? 50 56 FF 74 24 ?? FF 74 24 ?? FF 15 ?? ?? ?? ?? 8B 4C 24 ?? 8B 
            54 24 ?? 51 56 FF 74 24 ?? E8 ?? ?? ?? ?? 83 C4 ?? 53 53 FF 74 24 ?? FF 74 24 ?? FF 
            74 24 ?? FF D7 53 8D 44 24 ?? 50 56 FF 74 24 ?? FF 74 24 ?? FF 15 ?? ?? ?? ?? FF 15 
            ?? ?? ?? ?? FF 74 24 ?? 53 50 FF 15 ?? ?? ?? ?? 81 44 24 ?? ?? ?? ?? ?? 8B 44 24 ?? 
            11 5C 24 ?? 39 44 24 ?? 0F 8C ?? ?? ?? ?? 0F 8F ?? ?? ?? ?? 8B 4C 24 ?? 39 4C 24 ?? 
            0F 82 ?? ?? ?? ?? E9 ?? ?? ?? ?? 3B C3 0F 8C ?? ?? ?? ?? 7F ?? 81 F9 ?? ?? ?? ?? 0F
        }

        $encrypt_files_p3 = {
            86 ?? ?? ?? ?? 68 ?? ?? ?? ?? 8D 74 24 ?? E8 ?? ?? ?? ?? BE ?? ?? ?? ?? 56 E8 ?? ?? 
            ?? ?? 59 89 44 24 ?? FF 15 ?? ?? ?? ?? 53 53 33 C9 51 33 C0 50 FF 74 24 ?? FF D7 53 
            8D 44 24 ?? 50 56 FF 74 24 ?? FF 74 24 ?? FF 15 ?? ?? ?? ?? 8B 4C 24 ?? 8B 54 24 ?? 
            51 56 FF 74 24 ?? E8 ?? ?? ?? ?? 83 C4 ?? 53 53 33 C0 50 50 FF 74 24 ?? FF D7 53 8D 
            44 24 ?? 50 56 FF 74 24 ?? FF 74 24 ?? FF 15 ?? ?? ?? ?? FF 74 24 ?? E8 ?? ?? ?? ?? 
            59 E9 ?? ?? ?? ?? 51 53 FF 15 ?? ?? ?? ?? 50 FF 15 ?? ?? ?? ?? 89 44 24 ?? FF 15 ?? 
            ?? ?? ?? 53 53 33 C0 50 53 FF 74 24 ?? FF D7 53 8D 44 24 ?? 50 FF 74 24 ?? FF 74 24 
            ?? FF 74 24 ?? FF 15 ?? ?? ?? ?? 68 ?? ?? ?? ?? 8D 74 24 ?? E8 ?? ?? ?? ?? 8B 4C 24 
            ?? 8B 54 24 ?? 51 FF 74 24 ?? FF 74 24 ?? E8 ?? ?? ?? ?? 83 C4 ?? 53 53 33 C0 50 53 
            FF 74 24 ?? FF D7 53 8D 44 24 ?? 50 FF 74 24 ?? FF 74 24 ?? FF 74 24 ?? FF 15 ?? ?? 
            ?? ?? FF 74 24 ?? 53 FF 15 ?? ?? ?? ?? 50 FF 15 ?? ?? ?? ?? 6A ?? 33 FF 8D 74 24 ?? 
            E8 ?? ?? ?? ?? FF 74 24 ?? FF 15 ?? ?? ?? ?? FF 74 24 ?? E8 ?? ?? ?? ?? FF 74 24 ?? 
            E8 ?? ?? ?? ?? FF 74 24 ?? E8 ?? ?? ?? ?? FF 74 24 ?? E8 ?? ?? ?? ?? 68 ?? ?? ?? ?? 
            8D 45 ?? 8D 4C 24 ?? E8 ?? ?? ?? ?? 83 C4 ?? 83 78 ?? ?? 72 ?? 8B 00 83 7D ?? ?? 8B 
            4D ?? 73 ?? 8D 4D ?? 50 51 FF 15 ?? ?? ?? ?? 6A ?? 33 FF 8D 74 24 ?? E8 ?? ?? ?? ?? 
            6A ?? 33 FF 8D 75 ?? E8 ?? ?? ?? ?? 8B 4C 24 ?? 5F 5E 5B 33 CC E8 ?? ?? ?? ?? 8B E5 
            5D C3 
        }

        $find_files_1 = {
            55 8B EC 83 E4 ?? 81 EC ?? ?? ?? ?? A1 ?? ?? ?? ?? 33 C4 89 84 24 ?? ?? ?? ?? 53 56 
            57 6A ?? 5E 33 C0 33 FF 6A ?? 66 89 44 24 ?? 57 8D 45 ?? 8D 4C 24 ?? 89 74 24 ?? 89 
            7C 24 ?? E8 ?? ?? ?? ?? 68 ?? ?? ?? ?? 8D 84 24 ?? ?? ?? ?? E8 ?? ?? ?? ?? 33 C0 66 
            89 44 24 ?? 66 89 44 24 ?? 8B 84 24 ?? ?? ?? ?? 03 44 24 ?? 8D 4C 24 ?? 89 74 24 ?? 
            89 7C 24 ?? 89 74 24 ?? 89 7C 24 ?? E8 ?? ?? ?? ?? 57 8D 44 24 ?? 50 83 C8 ?? 8D 74 
            24 ?? E8 ?? ?? ?? ?? 57 8D 84 24 ?? ?? ?? ?? 50 83 C8 ?? E8 ?? ?? ?? ?? 8B DE 8D 44 
            24 ?? E8 ?? ?? ?? ?? 6A ?? E8 ?? ?? ?? ?? 83 7C 24 ?? ?? 8B 44 24 ?? 73 ?? 8D 44 24 
            ?? 8D 8C 24 ?? ?? ?? ?? 51 50 FF 15 ?? ?? ?? ?? 89 44 24 ?? 83 F8 ?? 0F 84 ?? ?? ?? 
            ?? 8B 35 ?? ?? ?? ?? 68 ?? ?? ?? ?? 8D 84 24
        }

        $find_files_2 = {
            D6 85 C0 0F 84 ?? ?? ?? ?? 68 ?? ?? ?? ?? 8D 84 24 ?? ?? ?? ?? 50 FF D6 85 C0 0F 84 
            ?? ?? ?? ?? 68 ?? ?? ?? ?? 8D 84 24 ?? ?? ?? ?? 50 FF D6 85 C0 0F 84 ?? ?? ?? ?? F6 
            84 24 ?? ?? ?? ?? ?? 8D 84 24 ?? ?? ?? ?? 50 8D 4C 24 ?? 8D 44 24 ?? 74 ?? E8 ?? ?? 
            ?? ?? 8D 4C 24 ?? 51 E8 ?? ?? ?? ?? 59 8B D8 59 8D 44 24 ?? E8 ?? ?? ?? ?? 6A ?? 33 
            FF 8D 74 24 ?? E8 ?? ?? ?? ?? 6A ?? 8D 74 24 ?? E8 ?? ?? ?? ?? 83 EC ?? 8B CC 21 79 
            ?? 33 C0 6A ?? C7 41 ?? ?? ?? ?? ?? 66 89 01 50 8D 44 24 ?? E8 ?? ?? ?? ?? E8 ?? ?? 
            ?? ?? 83 C4 ?? E9 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B D8 59 8D 44 24 ?? E8 ?? ?? ?? ?? 6A 
            ?? 33 FF 8D 74 24 ?? E8 ?? ?? ?? ?? 8D 84 24 ?? ?? ?? ?? 50 FF 15 ?? ?? ?? ?? 50 8D 
            44 24 ?? E8 ?? ?? ?? ?? 8B 44 24 ?? 6A ?? 5F 39 7C 24 ?? 73 ?? 8D 44 24 ?? 8B 35 ?? 
            ?? ?? ?? 68
        }

        $find_files_3 = {
            50 FF D6 85 C0 0F 84 ?? ?? ?? ?? 8B 44 24 ?? 39 7C 24 ?? 73 ?? 8D 44 24 ?? 68 ?? ?? 
            ?? ?? 50 FF D6 85 C0 0F 84 ?? ?? ?? ?? 8B 44 24 ?? 39 7C 24 ?? 73 ?? 8D 44 24 ?? 68 
            ?? ?? ?? ?? 50 FF D6 85 C0 0F 84 ?? ?? ?? ?? 8B 44 24 ?? 39 7C 24 ?? 73 ?? 8D 44 24 
            ?? 68 ?? ?? ?? ?? 50 FF D6 85 C0 74 ?? 8B 44 24 ?? 39 7C 24 ?? 73 ?? 8D 44 24 ?? 68 
            ?? ?? ?? ?? 50 FF D6 85 C0 74 ?? 8B 44 24 ?? 39 7C 24 ?? 73 ?? 8D 44 24 ?? 68 ?? ?? 
            ?? ?? 50 FF D6 85 C0 74 ?? 68 ?? ?? ?? ?? 8D 84 24 ?? ?? ?? ?? 50 FF D6 85 C0 74 ?? 
            8B 4C 24 ?? 39 7C 24 ?? 73 ?? 8D 4C 24 ?? 83 EC ?? 8B C4 51 E8 ?? ?? ?? ?? E8 ?? ?? 
            ?? ?? 83 C4 ?? 6A ?? 33 FF 8D 74 24 ?? E8 ?? ?? ?? ?? 8D 84 24 ?? ?? ?? ?? 50 FF 74 
            24 ?? FF 15 ?? ?? ?? ?? 85 C0 0F 85 ?? ?? ?? ?? FF 74 24 ?? FF 15 ?? ?? ?? ?? 33 DB 
            43 53 33 FF 8D 74 24 ?? E8 ?? ?? ?? ?? 53 8D B4 24 ?? ?? ?? ?? E8 ?? ?? ?? ?? 53 8D 
            74 24 ?? E8 ?? ?? ?? ?? 53 8D 75 ?? E8 ?? ?? ?? ?? 8B 8C 24 ?? ?? ?? ?? 5F 5E 5B 33 
            CC E8 ?? ?? ?? ?? 8B E5 5D C3
        }
                
    condition:
        uint16(0) == 0x5A4D and 
        (
            all of ($find_files_*)
        ) and 
        (
            $create_encryption_key
        ) and
        (
            $encrypt_encryption_key
        ) and
        (
            all of ($encrypt_files_p*)
        )
}
