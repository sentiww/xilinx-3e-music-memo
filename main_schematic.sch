<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="XLXN_3(11:0)" />
        <signal name="XLXN_4(3:0)" />
        <signal name="XLXN_5(3:0)" />
        <signal name="Clk_50MHz" />
        <signal name="RESET" />
        <signal name="SPI_MOSI" />
        <signal name="SPI_MISO" />
        <signal name="SPI_SCK" />
        <signal name="DAC_CS" />
        <signal name="DAC_CLR" />
        <signal name="SPI_SS_B" />
        <signal name="AMP_CS" />
        <signal name="AD_CONV" />
        <signal name="SF_CE0" />
        <signal name="FPGA_INIT_B" />
        <signal name="Busy" />
        <signal name="XLXN_32(7:0)" />
        <signal name="XLXN_33" />
        <signal name="PS2_Clk" />
        <signal name="PS2_Data" />
        <signal name="RS232_TxD" />
        <signal name="RS232_RxD" />
        <signal name="XLXN_65" />
        <signal name="XLXN_66(7:0)" />
        <signal name="TxBusyLed" />
        <signal name="XLXN_69(15:0)" />
        <port polarity="Input" name="Clk_50MHz" />
        <port polarity="Input" name="RESET" />
        <port polarity="Output" name="SPI_MOSI" />
        <port polarity="Input" name="SPI_MISO" />
        <port polarity="Output" name="SPI_SCK" />
        <port polarity="Output" name="DAC_CS" />
        <port polarity="Output" name="DAC_CLR" />
        <port polarity="Output" name="SPI_SS_B" />
        <port polarity="Output" name="AMP_CS" />
        <port polarity="Output" name="AD_CONV" />
        <port polarity="Output" name="SF_CE0" />
        <port polarity="Output" name="FPGA_INIT_B" />
        <port polarity="Output" name="Busy" />
        <port polarity="Input" name="PS2_Clk" />
        <port polarity="Input" name="PS2_Data" />
        <port polarity="Output" name="RS232_TxD" />
        <port polarity="Input" name="RS232_RxD" />
        <port polarity="Output" name="TxBusyLed" />
        <blockdef name="DACWrite">
            <timestamp>2024-4-23T21:37:8</timestamp>
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <rect width="64" x="0" y="-492" height="24" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <rect width="64" x="0" y="-428" height="24" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="448" y1="-224" y2="-224" x1="384" />
            <line x2="448" y1="-160" y2="-160" x1="384" />
            <line x2="448" y1="-96" y2="-96" x1="384" />
            <line x2="448" y1="-32" y2="-32" x1="384" />
            <line x2="448" y1="32" y2="32" x1="384" />
            <line x2="448" y1="96" y2="96" x1="384" />
            <line x2="448" y1="-544" y2="-544" x1="384" />
            <line x2="448" y1="-416" y2="-416" x1="384" />
            <line x2="384" y1="-480" y2="-480" x1="448" />
            <line x2="448" y1="-352" y2="-352" x1="384" />
            <line x2="448" y1="-288" y2="-288" x1="384" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <rect width="320" x="64" y="-576" height="760" />
            <line x2="0" y1="96" y2="96" x1="64" />
            <line x2="0" y1="160" y2="160" x1="64" />
        </blockdef>
        <blockdef name="constant">
            <timestamp>2006-1-1T10:10:10</timestamp>
            <rect width="112" x="0" y="0" height="64" />
            <line x2="112" y1="32" y2="32" x1="144" />
        </blockdef>
        <blockdef name="frequency_generator">
            <timestamp>2024-4-24T20:22:8</timestamp>
            <rect width="64" x="0" y="84" height="24" />
            <line x2="0" y1="96" y2="96" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="256" x="64" y="-128" height="256" />
        </blockdef>
        <blockdef name="RS232">
            <timestamp>2024-4-24T20:38:8</timestamp>
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="320" y1="-288" y2="-288" x1="384" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="256" x="64" y="-320" height="384" />
        </blockdef>
        <blockdef name="PS2_Rx">
            <timestamp>2024-4-24T20:41:44</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-236" height="24" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
        </blockdef>
        <blockdef name="rs232_keyboard_to_frequency">
            <timestamp>2024-4-24T20:33:28</timestamp>
            <rect width="384" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="448" y="-108" height="24" />
            <line x2="512" y1="-96" y2="-96" x1="448" />
        </blockdef>
        <block symbolname="DACWrite" name="XLXI_1">
            <blockpin signalname="RESET" name="Reset" />
            <blockpin signalname="XLXN_1" name="Start" />
            <blockpin signalname="SPI_MISO" name="SPI_MISO" />
            <blockpin signalname="XLXN_4(3:0)" name="Cmd(3:0)" />
            <blockpin signalname="XLXN_5(3:0)" name="Addr(3:0)" />
            <blockpin signalname="XLXN_3(11:0)" name="DATA(11:0)" />
            <blockpin signalname="DAC_CLR" name="DAC_CLR" />
            <blockpin signalname="DAC_CS" name="DAC_CS" />
            <blockpin signalname="SPI_MOSI" name="SPI_MOSI" />
            <blockpin signalname="SPI_SCK" name="SPI_SCK" />
            <blockpin signalname="SPI_SS_B" name="SPI_SS_B" />
            <blockpin signalname="AMP_CS" name="AMP_CS" />
            <blockpin signalname="AD_CONV" name="AD_CONV" />
            <blockpin signalname="SF_CE0" name="SF_CE0" />
            <blockpin signalname="FPGA_INIT_B" name="FPGA_INIT_B" />
            <blockpin signalname="Busy" name="Busy" />
            <blockpin signalname="Clk_50MHz" name="Clk_50MHz" />
            <blockpin signalname="Clk_50MHz" name="Clk_Sys" />
        </block>
        <block symbolname="frequency_generator" name="XLXI_7">
            <blockpin signalname="Clk_50MHz" name="clk" />
            <blockpin signalname="RESET" name="reset" />
            <blockpin signalname="XLXN_69(15:0)" name="frequencyModCount(15:0)" />
            <blockpin signalname="XLXN_1" name="start" />
            <blockpin signalname="XLXN_3(11:0)" name="saw(11:0)" />
        </block>
        <block symbolname="constant" name="XLXI_3">
            <attr value="3" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_4(3:0)" name="O" />
        </block>
        <block symbolname="constant" name="XLXI_4">
            <attr value="F" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_5(3:0)" name="O" />
        </block>
        <block symbolname="RS232" name="XLXI_10">
            <blockpin signalname="Clk_50MHz" name="Clk_50MHz" />
            <blockpin signalname="RESET" name="Reset" />
            <blockpin signalname="RS232_RxD" name="RS232_RxD" />
            <blockpin signalname="XLXN_33" name="TxStart" />
            <blockpin signalname="XLXN_32(7:0)" name="TxDI(7:0)" />
            <blockpin signalname="TxBusyLed" name="TxBusy" />
            <blockpin signalname="XLXN_65" name="RxRdy" />
            <blockpin signalname="RS232_TxD" name="RS232_TxD" />
            <blockpin signalname="XLXN_66(7:0)" name="RxDO(7:0)" />
            <blockpin signalname="Clk_50MHz" name="Clk_Sys" />
        </block>
        <block symbolname="PS2_Rx" name="XLXI_11">
            <blockpin signalname="PS2_Clk" name="PS2_Clk" />
            <blockpin signalname="PS2_Data" name="PS2_Data" />
            <blockpin signalname="Clk_50MHz" name="Clk_50MHz" />
            <blockpin signalname="Clk_50MHz" name="Clk_Sys" />
            <blockpin signalname="XLXN_33" name="DO_Rdy" />
            <blockpin signalname="XLXN_32(7:0)" name="DO(7:0)" />
        </block>
        <block symbolname="rs232_keyboard_to_frequency" name="XLXI_19">
            <blockpin signalname="XLXN_65" name="rxRdy" />
            <blockpin signalname="XLXN_66(7:0)" name="ascii(7:0)" />
            <blockpin signalname="XLXN_69(15:0)" name="frequencyModCount(15:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="XLXN_1">
            <wire x2="2848" y1="960" y2="960" x1="2624" />
        </branch>
        <branch name="XLXN_3(11:0)">
            <wire x2="2656" y1="1024" y2="1024" x1="2624" />
            <wire x2="2656" y1="1024" y2="1152" x1="2656" />
            <wire x2="2848" y1="1152" y2="1152" x1="2656" />
        </branch>
        <branch name="XLXN_4(3:0)">
            <wire x2="2848" y1="1024" y2="1024" x1="2832" />
        </branch>
        <branch name="XLXN_5(3:0)">
            <wire x2="2848" y1="1088" y2="1088" x1="2832" />
        </branch>
        <branch name="SPI_MOSI">
            <wire x2="3312" y1="960" y2="960" x1="3296" />
        </branch>
        <branch name="SPI_MISO">
            <wire x2="3312" y1="1024" y2="1024" x1="3296" />
        </branch>
        <branch name="SPI_SCK">
            <wire x2="3312" y1="1088" y2="1088" x1="3296" />
        </branch>
        <branch name="DAC_CS">
            <wire x2="3312" y1="1152" y2="1152" x1="3296" />
        </branch>
        <branch name="DAC_CLR">
            <wire x2="3312" y1="1216" y2="1216" x1="3296" />
        </branch>
        <branch name="SPI_SS_B">
            <wire x2="3312" y1="1280" y2="1280" x1="3296" />
        </branch>
        <branch name="AMP_CS">
            <wire x2="3312" y1="1344" y2="1344" x1="3296" />
        </branch>
        <branch name="AD_CONV">
            <wire x2="3312" y1="1408" y2="1408" x1="3296" />
        </branch>
        <branch name="SF_CE0">
            <wire x2="3312" y1="1472" y2="1472" x1="3296" />
        </branch>
        <branch name="FPGA_INIT_B">
            <wire x2="3312" y1="1536" y2="1536" x1="3296" />
        </branch>
        <branch name="Busy">
            <wire x2="3312" y1="1600" y2="1600" x1="3296" />
        </branch>
        <iomarker fontsize="28" x="3312" y="960" name="SPI_MOSI" orien="R0" />
        <iomarker fontsize="28" x="3312" y="1024" name="SPI_MISO" orien="R0" />
        <iomarker fontsize="28" x="3312" y="1088" name="SPI_SCK" orien="R0" />
        <iomarker fontsize="28" x="3312" y="1152" name="DAC_CS" orien="R0" />
        <iomarker fontsize="28" x="3312" y="1216" name="DAC_CLR" orien="R0" />
        <iomarker fontsize="28" x="3312" y="1280" name="SPI_SS_B" orien="R0" />
        <iomarker fontsize="28" x="3312" y="1344" name="AMP_CS" orien="R0" />
        <iomarker fontsize="28" x="3312" y="1408" name="AD_CONV" orien="R0" />
        <iomarker fontsize="28" x="3312" y="1472" name="SF_CE0" orien="R0" />
        <iomarker fontsize="28" x="3312" y="1536" name="FPGA_INIT_B" orien="R0" />
        <iomarker fontsize="28" x="3312" y="1600" name="Busy" orien="R0" />
        <instance x="2848" y="1504" name="XLXI_1" orien="R0">
        </instance>
        <instance x="2688" y="992" name="XLXI_3" orien="R0">
        </instance>
        <instance x="2688" y="1056" name="XLXI_4" orien="R0">
        </instance>
        <instance x="2240" y="1056" name="XLXI_7" orien="R0">
        </instance>
        <iomarker fontsize="28" x="192" y="960" name="Clk_50MHz" orien="R180" />
        <iomarker fontsize="28" x="368" y="1024" name="RESET" orien="R180" />
        <branch name="Clk_50MHz">
            <wire x2="208" y1="960" y2="960" x1="192" />
            <wire x2="2240" y1="960" y2="960" x1="208" />
            <wire x2="208" y1="960" y2="1392" x1="208" />
            <wire x2="640" y1="1392" y2="1392" x1="208" />
            <wire x2="656" y1="1392" y2="1392" x1="640" />
            <wire x2="208" y1="1392" y2="1456" x1="208" />
            <wire x2="208" y1="1456" y2="1600" x1="208" />
            <wire x2="2320" y1="1600" y2="1600" x1="208" />
            <wire x2="2848" y1="1600" y2="1600" x1="2320" />
            <wire x2="2320" y1="1600" y2="1664" x1="2320" />
            <wire x2="2848" y1="1664" y2="1664" x1="2320" />
            <wire x2="1136" y1="1456" y2="1456" x1="208" />
            <wire x2="1152" y1="1456" y2="1456" x1="1136" />
            <wire x2="656" y1="1328" y2="1328" x1="640" />
            <wire x2="640" y1="1328" y2="1392" x1="640" />
            <wire x2="1152" y1="1392" y2="1392" x1="1136" />
            <wire x2="1136" y1="1392" y2="1456" x1="1136" />
        </branch>
        <branch name="XLXN_32(7:0)">
            <wire x2="1152" y1="1200" y2="1200" x1="1040" />
        </branch>
        <branch name="XLXN_33">
            <wire x2="1152" y1="1264" y2="1264" x1="1040" />
        </branch>
        <instance x="1152" y="1424" name="XLXI_10" orien="R0">
        </instance>
        <instance x="656" y="1424" name="XLXI_11" orien="R0">
        </instance>
        <branch name="PS2_Clk">
            <wire x2="656" y1="1200" y2="1200" x1="624" />
        </branch>
        <iomarker fontsize="28" x="624" y="1200" name="PS2_Clk" orien="R180" />
        <branch name="PS2_Data">
            <wire x2="656" y1="1264" y2="1264" x1="624" />
        </branch>
        <iomarker fontsize="28" x="624" y="1264" name="PS2_Data" orien="R180" />
        <branch name="RS232_TxD">
            <wire x2="1568" y1="1200" y2="1200" x1="1536" />
        </branch>
        <branch name="RS232_RxD">
            <wire x2="1568" y1="1136" y2="1136" x1="1536" />
        </branch>
        <iomarker fontsize="28" x="1568" y="1136" name="RS232_RxD" orien="R0" />
        <branch name="RESET">
            <wire x2="384" y1="1024" y2="1024" x1="368" />
            <wire x2="2240" y1="1024" y2="1024" x1="384" />
            <wire x2="384" y1="1024" y2="1536" x1="384" />
            <wire x2="1056" y1="1536" y2="1536" x1="384" />
            <wire x2="2848" y1="1536" y2="1536" x1="1056" />
            <wire x2="1152" y1="1328" y2="1328" x1="1056" />
            <wire x2="1056" y1="1328" y2="1536" x1="1056" />
        </branch>
        <branch name="XLXN_65">
            <wire x2="1760" y1="1328" y2="1328" x1="1536" />
        </branch>
        <branch name="XLXN_66(7:0)">
            <wire x2="1712" y1="1264" y2="1264" x1="1536" />
            <wire x2="1712" y1="1264" y2="1392" x1="1712" />
            <wire x2="1760" y1="1392" y2="1392" x1="1712" />
        </branch>
        <branch name="TxBusyLed">
            <wire x2="1552" y1="1392" y2="1392" x1="1536" />
        </branch>
        <branch name="XLXN_69(15:0)">
            <wire x2="2240" y1="1152" y2="1152" x1="2208" />
            <wire x2="2208" y1="1152" y2="1216" x1="2208" />
            <wire x2="2336" y1="1216" y2="1216" x1="2208" />
            <wire x2="2336" y1="1216" y2="1328" x1="2336" />
            <wire x2="2336" y1="1328" y2="1328" x1="2272" />
        </branch>
        <iomarker fontsize="28" x="1552" y="1392" name="TxBusyLed" orien="R0" />
        <iomarker fontsize="28" x="1568" y="1200" name="RS232_TxD" orien="R0" />
        <instance x="1760" y="1424" name="XLXI_19" orien="R0">
        </instance>
    </sheet>
</drawing>