OpenEmbedded/Yocto Digi Embedded DISPLAYS Layer
============================================

This layer provides support for various displays for Digi hardware and 
the Digi Embedded Yocto (DEY) BSP layers.

This layer depends on the following layers:

https://github.com/digi-embedded/meta-digi

Supported Displays
------------------
  
  * Sharp LQ043Y1DY01 4.3" 

Supported Platforms
-------------------

  * Digi ConnectCore 6UL SBC Pro 

Installation
------------
1. Install Digi Embedded Yocto distribution (dey-2.4-r1)

    https://github.com/digi-embedded/dey-manifest#installing-digi-embedded-yocto

2. Clone *meta-displays* Yocto layer under the Digi Embedded Yocto source
   directory

        #> cd <DEY-INSTALLDIR>/sources
        #> git clone https://github.com/chaegle/meta-displays.git -b rocko

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

4. Build the images

        #> bitbake dey-image-qt 

5. Deploy the images 
