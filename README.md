OpenEmbedded/Yocto Digi Embedded DISPLAYS Layer
============================================

This layer provides support for various displays for Digi hardware and 
the Digi Embedded Yocto (DEY) BSP layers.

This layer depends on the following layers:

https://github.com/digi-embedded/meta-digi

Supported Displays
------------------
  
  * Sharp LQ043Y1DY01 4.3" 
  * Digi 10" LCD Application kit (P/N: CC-ACC-LCDW-10)

Supported Platforms
-------------------

  * Digi ConnectCore 6UL SBC Pro 
  * Digi connectCore 6 SBC (Quad and Dual)
  * Digi ConnectCore 6 Quad Plus SBC

Installation
------------
1. Install Digi Embedded Yocto distribution (dey-2.4-r1)

    https://github.com/digi-embedded/dey-manifest#installing-digi-embedded-yocto

2. Clone *meta-displays* Yocto layer under the Digi Embedded Yocto source
   directory

        #> cd <DEY-INSTALLDIR>/sources
        #> git clone https://github.com/chaegle/meta-displays.git -b rocko

Hardware modification
---------------------

The LCD controller on the Sharp LQ043Y1DY01 display requires initial configuration via SPI. 
By default the SPI (ecspi1) interface is not connected to the Parallel LCD connector
(J21). Four pairs of resistor pads must be shorted in order to establish this 
connection. Refer to the image ccimx6ulsbc_layout_spi.png for details as to the location
of these pads. 
  
Create and build a project
--------------------------

1. Create a project for ConnectCore 6UL SBC Pro.

        #> mkdir <project-dir>
        #> cd <project-dir>
        #> . <DEY-INSTALLDIR>/mkproject.sh -p ccimx6ulsbc

2. Add the *meta-displays* layer to the project's *bblayers.conf*
  configuration file.

        #> vi <project-dir>/conf/bblayers.conf

        <DEY-INSTALLDIR>/sources/meta-displays

        *OR*

        #> bitbake-layers add-layer <DEY-INSTALLDIR>/sources/meta-displays 

3. Configure the project.
     
        Add the following line(s) to your project's local.conf.
        
        *Sharp LQ043 on ccimx6ulsbc*

        DISP_LQ043 = "1"

        *Fusion 10" on ccimx6sbc and ccimx6qpsbc*
 
        # Enable Digi LCD Application kit support
        DISP_FUSION = "1"
        # Uncomment one of the below lines to enable touch
        # for the appropriate I2C address
        DISP_FUSION_ADDR_10 = "1"
        #DISP_FUSION_ADDR_14 = "1"

4. Build the images

        #> bitbake dey-image-qt 

5. Deploy the images 
