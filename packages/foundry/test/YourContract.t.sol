// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../contracts/TokenFactory.sol";

contract TokenFactoryTest is Test {
    TokenFactory public tokenFactory;
    address public owner;

    function setUp() public {
        tokenFactory = new TokenFactory();
        owner = address(this);
    }

    function testCreateCustomToken() public {
        string memory name = "Custom Token";
        string memory symbol = "CTK";
        uint256 initialSupply = 1000;
        bool isPausable = true;

        address tokenAddress = tokenFactory.createCustomToken(name, symbol, initialSupply, owner, isPausable);

        CustomToken token = CustomToken(tokenAddress);

        assertEq(token.name(), name);
        assertEq(token.symbol(), symbol);
        assertEq(token.totalSupply(), initialSupply * (10 ** token.decimals()));
        assertEq(token.owner(), owner);
    }

    function testCreateFlashMintableCustomToken() public {
        string memory name = "Flash Mintable Token";
        string memory symbol = "FMT";
        uint256 initialSupply = 2000;
        bool isPausable = false;

        address tokenAddress = tokenFactory.createFlashMintableCustomToken(name, symbol, initialSupply, owner, isPausable);

        FlashMintableCustomToken token = FlashMintableCustomToken(tokenAddress);

        assertEq(token.name(), name);
        assertEq(token.symbol(), symbol);
        assertEq(token.totalSupply(), initialSupply * (10 ** token.decimals()));
        assertEq(token.owner(), owner);
    }

    function testCreateManagedCustomToken() public {
        string memory name = "Managed Token";
        string memory symbol = "MTK";
        uint256 initialSupply = 3000;
        bool isPausable = true;

        address tokenAddress = tokenFactory.createManagedCustomToken(name, symbol, initialSupply, owner, isPausable);

        ManagedCustomToken token = ManagedCustomToken(tokenAddress);

        assertEq(token.name(), name);
        assertEq(token.symbol(), symbol);
        assertEq(token.totalSupply(), initialSupply * (10 ** token.decimals()));
    }

    function testCreateManagedFlashMintableCustomToken() public {
        string memory name = "Managed Flash Mintable Token";
        string memory symbol = "MFMT";
        uint256 initialSupply = 4000;
        bool isPausable = false;

        address tokenAddress = tokenFactory.createManagedFlashMintableCustomToken(name, symbol, initialSupply, owner, isPausable);

        ManagedFlashMintableCustomToken token = ManagedFlashMintableCustomToken(tokenAddress);

        assertEq(token.name(), name);
        assertEq(token.symbol(), symbol);
        assertEq(token.totalSupply(), initialSupply * (10 ** token.decimals()));
        assertEq(token.owner(), owner);
    }
}