import "https://raw.githubusercontent.com/huangzhibo/Learn/master/hello_world.wdl" as wh

workflow HelloWorld {

        #Array[Array[String]] inputSamples = read_tsv("/Users/huangzhibo/GitHub/wdl/test/slide_lane.tsv")
        Array[Array[String]] inputSamples = [["hello", "world"]] 

        call wh.WriteHello
	
	call WriteWorld {
	    input:slide=inputSamples[0]
	}
	
	output {
		File helloFile = WriteHello.outfile
		File testFile = WriteWorld.test
	}
}

task WriteWorld {
        Array[String] slide

	command {
                echo ${slide[1]}
                echo "test123" >test
	}

	output {
		File outfile = stdout()
		File test = "test" 
	}
}
