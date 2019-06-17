pragma solidity ^0.5.0;

import "openzeppelin-solidity/contracts/token/ERC721/ERC721Full.sol";
import "openzeppelin-solidity/contracts/token/ERC721/ERC721Mintable.sol";
import "openzeppelin-solidity/contracts/token/ERC721/ERC721Burnable.sol";

contract ClimberFilmToken is ERC721Full, ERC721Mintable, ERC721Burnable {

    /* DATA STRUCT */
    struct ClimberFilm {
        string title;
        string text;
        string ipfsHash;
        address mintedBy;
        uint64 mintedAt;
    }

    /* STORAGE */
    ClimberFilm[] climberFilms;

    /* CONSTRUCTOR */
    constructor() ERC721Full("ClimberFilmToken", "CFT") public {
    }

    function mint(string memory _title, string memory _text, string memory _ipfsHash) public returns (uint256) {
        require(msg.sender != address(0), "invalid address for mint");
        ClimberFilm memory climberFilm = ClimberFilm({
            title: _title,
            text: _text,
            ipfsHash: _ipfsHash,
            mintedBy: msg.sender,
            mintedAt: uint64(block.timestamp)
        });

        uint256 tokenId = climberFilms.push(climberFilm) - 1;
        super.mint(msg.sender, tokenId);

        return tokenId;
    }

    function burn(uint256 _tokenId) public {
        super.burn(_tokenId);
        if (climberFilms.length != 0) {
            delete climberFilms[_tokenId];
        }
    }

    function buy() public {
        // TODO: Implement
    }

    function approve() public {
        // TODO: Implement
    }

    // Get method for test
    function getByTokenId(uint256 _tokenId) public view returns (string memory title,
                                                                string memory text,
                                                                string memory ipfsHash,
                                                                address mintedBy,
                                                                uint64 mintedAt) {
        ClimberFilm memory climberFilm = climberFilms[_tokenId];

        title = climberFilm.title;
        text = climberFilm.text;
        ipfsHash = climberFilm.ipfsHash;
        mintedBy = climberFilm.mintedBy;
        mintedAt = climberFilm.mintedAt;
    }
}
