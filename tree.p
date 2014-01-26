program treePascal (input, output);
        type 	tree = ^node;
             	node = record
                	info : integer;
                	left : tree;
                	right : tree;
        end;

        function insert (var root : tree; value : integer) : tree;
        begin
		if root = nil then 
		begin
			new(root);
			root^.info := value;
			root^.left := nil;
			root^.right := nil
		end
		else if root^.info < value then 
			root^.right := insert(root^.right, value)
		else if root^.info > value then
			root^.left := insert(root^.left, value);
		
		insert := root;
        end;

	function member (var root : tree; value : integer) : integer;
	begin
		if root = nil then
			exit(0)
		else if root^.info = value then
			exit(1)
		else if root^.info < value then
			exit(member(root^.right, value))
		else 
			exit(member(root^.left, value))
	end;

	var t : tree; x : integer;
begin
	t := nil;
	readln(x);
	
	while x <> -1 do begin
		t := insert(t, x);
		readln(x);
	end;

	readln(x);

	while x <> -1 do begin
		if member(t,x) = 1 then
			writeln('true')
		else
			writeln('false');
		readln(x);
	end;
end.            
