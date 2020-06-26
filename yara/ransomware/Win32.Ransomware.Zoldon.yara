rule Win32_Ransomware_Zoldon : tc_detection malicious
{
    meta:

        author              = "ReversingLabs"
        tc_detection_type   = "Ransomware"
        tc_detection_name   = "Zoldon"
        tc_detection_factor = 5

    strings:

        $main_encrypt_function_p1 = {
            55 8B EC 81 C4 ?? ?? ?? ?? 33 C9 89 8D ?? ?? ?? ?? 89 8D ?? ?? ?? ?? 89 8D ?? ?? ?? 
            ?? 89 8D ?? ?? ?? ?? 89 4D ?? 89 8D ?? ?? ?? ?? 89 4D ?? 89 4D ?? 89 55 ?? 89 45 ?? 
            8D 85 ?? ?? ?? ?? 8B 15 ?? ?? ?? ?? E8 ?? ?? ?? ?? 33 C0 55 68 ?? ?? ?? ?? 64 FF 30 
            64 89 20 E8 ?? ?? ?? ?? DD 5D ?? 9B 8B 45 ?? 89 45 ?? 8B 45 ?? 89 45 ?? FF 75 ?? FF 
            75 ?? 8D 55 ?? A1 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8D 45 ?? 8B 55 ?? E8 ?? ?? ?? ?? B2 ?? 
            A1 ?? ?? ?? ?? E8 ?? ?? ?? ?? 89 45 ?? B1 ?? BA ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 
            3C ?? 0F 85 ?? ?? ?? ?? B0 ?? E8 ?? ?? ?? ?? BA ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 
            84 C0 0F 85 ?? ?? ?? ?? 8B 4D ?? BA ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 8B 45 ?? C6 
            80 ?? ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? BA ?? 
            ?? ?? ?? E8 ?? ?? ?? ?? 8B 95 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 66 C7 45
        }

        $main_encrypt_function_p2 = {
            8D 85 ?? ?? ?? ?? 66 8B 55 ?? E8 ?? ?? ?? ?? 8B 95 ?? ?? ?? ?? 8D 45 ?? B9 ?? ?? ?? 
            ?? E8 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? 83 F8 ?? 75 ?? 66 83 7D 
            ?? ?? 74 ?? 8D 85 ?? ?? ?? ?? 66 8B 55 ?? E8 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? BA ?? ?? 
            ?? ?? E8 ?? ?? ?? ?? 8B 95 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 66 FF 45 ?? 66 83 7D 
            ?? ?? 75 ?? 8B 4D ?? BA ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 
            8D 95 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? 
            ?? ?? 8B 95 ?? ?? ?? ?? 33 C9 8D 85 ?? ?? ?? ?? E8 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8D 85 
            ?? ?? ?? ?? E8 ?? ?? ?? ?? E8 ?? ?? ?? ?? BA ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? E8 ?? ?? 
            ?? ?? E8 ?? ?? ?? ?? E8 ?? ?? ?? ?? BA ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? E8 ?? ?? ?? ?? 
            E8 ?? ?? ?? ?? E8 ?? ?? ?? ?? BA ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? E8 ?? ?? ?? ?? E8 ?? 
            ?? ?? ?? E8 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? E8 ?? ?? ?? ?? E8 ?? ?? ?? ?? 33 C0 5A 59 
            59 64 89 10 68 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 8D 85 ?? 
            ?? ?? ?? E8 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 8B 15 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8D 45 ?? 
            E8 ?? ?? ?? ?? 8D 45 ?? E8 ?? ?? ?? ?? 8D 45 ?? E8 ?? ?? ?? ?? C3 
        }

        $write_zoldon_regkey = {
            55 8B EC 83 C4 ?? 53 56 33 DB 89 5D ?? 88 4D ?? 8B DA 8B F0 33 C0 55 68 ?? ?? ?? ?? 
            64 FF 30 64 89 20 8D 45 ?? 8B D3 E8 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 8B D8 84 DB 
            75 ?? 8D 45 ?? B9 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 33 C0 89 45 ?? 80 7D ?? 
            ?? 74 ?? 83 7D ?? ?? 75 ?? 8D 45 ?? 50 8B 46 ?? 50 6A ?? 8B 45 ?? E8 ?? ?? ?? ?? 50 
            8B D3 8B C6 E8 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? 8B D0 8B C6 E8 ?? ?? ?? ?? 88 45 ?? EB 
            ?? 8D 45 ?? 50 8D 45 ?? 50 6A ?? 8B 46 ?? 50 6A ?? 6A ?? 6A ?? 8B 45 ?? E8 ?? ?? ?? 
            ?? 50 8B D3 8B C6 E8 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? 8B D0 8B C6 E8 ?? ?? ?? ?? 88 45 
            ?? 80 7D ?? ?? 74 ?? 83 7E ?? ?? 0F 95 C0 84 D8 74 ?? FF 76 ?? 68 ?? ?? ?? ?? FF 75 
            ?? 8D 45 ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 4D ?? 8B 55 ?? 8B C6 E8 ?? ?? ?? ?? 33 
            C0 5A 59 59 64 89 10 68 ?? ?? ?? ?? 8D 45 ?? E8 ?? ?? ?? ?? C3 
        }

        $find_files_p1 = {
            55 8B EC 81 C4 ?? ?? ?? ?? 33 C9 89 8D ?? ?? ?? ?? 89 8D ?? ?? ?? ?? 89 8D ?? ?? ?? 
            ?? 89 8D ?? ?? ?? ?? 89 4D ?? 89 4D ?? 89 4D ?? 89 4D ?? 89 4D ?? 89 4D ?? 89 55 ?? 
            89 45 ?? 8D 85 ?? ?? ?? ?? 8B 15 ?? ?? ?? ?? E8 ?? ?? ?? ?? 33 C0 55 68 ?? ?? ?? ?? 
            64 FF 30 64 89 20 8D 85 ?? ?? ?? ?? B9 ?? ?? ?? ?? 8B 55 ?? E8 ?? ?? ?? ?? 8B 85 ?? 
            ?? ?? ?? 8D 8D ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 85 C0 0F 85 ?? ?? ?? ?? 33 
            C0 55 68 ?? ?? ?? ?? 64 FF 30 64 89 20 F6 85 ?? ?? ?? ?? ?? 0F 85 ?? ?? ?? ?? 8B 45 
            ?? 80 B8 ?? ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? B9 ?? ?? ?? ?? 8B 55 ?? B8 ?? ?? ?? ?? E8 
            ?? ?? ?? ?? 85 C0 75 ?? B9 ?? ?? ?? ?? 8B 55 ?? B8 ?? ?? ?? ?? E8 ?? ?? ?? ?? 85 C0 
            74 ?? E8 ?? ?? ?? ?? E9 ?? ?? ?? ?? 8D 45 ?? 8B 55 ?? E8 ?? ?? ?? ?? 33 C0 55 68 ?? 
            ?? ?? ?? 64 FF 30 64 89 20 8D 55 ?? 8B 45 ?? E8 ?? ?? ?? ?? 33 C0 5A 59 59 64 89 10 
            68 ?? ?? ?? ?? 8D 45 ?? E8 ?? ?? ?? ?? C3 E9 ?? ?? ?? ?? EB ?? 8D 85 ?? ?? ?? ?? 8B
        }

        $find_files_p2 = {
            8D ?? ?? ?? ?? 8B 55 ?? E8 ?? ?? ?? ?? 8B 95 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? E9 
            ?? ?? ?? ?? B9 ?? ?? ?? ?? 8B 55 ?? B8 ?? ?? ?? ?? E8 ?? ?? ?? ?? 85 C0 75 ?? B9 ?? 
            ?? ?? ?? 8B 55 ?? B8 ?? ?? ?? ?? E8 ?? ?? ?? ?? 85 C0 74 ?? E8 ?? ?? ?? ?? E9 ?? ?? 
            ?? ?? 8D 45 ?? 8B 55 ?? E8 ?? ?? ?? ?? 33 C0 55 68 ?? ?? ?? ?? 64 FF 30 64 89 20 8D 
            55 ?? 8B 45 ?? E8 ?? ?? ?? ?? 33 C0 5A 59 59 64 89 10 68 ?? ?? ?? ?? 8D 45 ?? E8 ?? 
            ?? ?? ?? C3 E9 ?? ?? ?? ?? EB ?? 8D 85 ?? ?? ?? ?? 8B 8D ?? ?? ?? ?? 8B 55 ?? E8 ?? 
            ?? ?? ?? 8B 95 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? E9 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 
            BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 74 ?? 8B 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 
            74 ?? 8D 45 ?? 8B 55 ?? E8 ?? ?? ?? ?? 33 C0 55 68 ?? ?? ?? ?? 64 FF 30 64 89 20 8D 
            55 ?? 8B 45 ?? E8 ?? ?? ?? ?? 33 C0 5A 59 59 64 89 10 68 ?? ?? ?? ?? 8D 45 ?? E8 ?? 
            ?? ?? ?? C3 E9 ?? ?? ?? ?? EB ?? 8D 85 ?? ?? ?? ?? 8B 8D ?? ?? ?? ?? 8B 55 ?? E8 ?? 
            ?? ?? ?? 8B 95 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? E8 ?? ?? ?? ?? 
            85 C0 0F 84 ?? ?? ?? ?? 33 C0 5A 59 59 64 89 10 68 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? E8 
            ?? ?? ?? ?? C3 E9 ?? ?? ?? ?? EB ?? 33 C0 5A 59 59 64 89 10 68 ?? ?? ?? ?? 8D 85 ?? 
            ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 8B 15 ?? ?? ?? ?? E8 ?? ?? 
            ?? ?? 8D 45 ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? C3 E9 ?? ?? ?? ?? EB ?? 8B E5 5D C3 
        }

    condition:
        uint16(0) == 0x5A4D and 
        (
            $write_zoldon_regkey
        ) and 
        (
            all of ($find_files_p*)
        ) and 
        (
            all of ($main_encrypt_function_p*)
        )
}