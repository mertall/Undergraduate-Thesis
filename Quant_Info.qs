namespace preprocess {
    

    operation information(t: Int[], N : Int, y : Int,i : Int) : Qubit[ 
        {
            using aux = Qubit(N+1)
            {
                within
                {
                    ApplytoAll(i/sqrt(N), aux);
                    ApplytoAll(H)

                } apply
                {

                }

            }   
        }
    ]




}