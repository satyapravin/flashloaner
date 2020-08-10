
// File: @openzeppelin\contracts\math\SafeMath.sol

pragma solidity ^0.6.6;

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     *
     * _Available since v2.4.0._
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     *
     * _Available since v2.4.0._
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     *
     * _Available since v2.4.0._
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

// File: @openzeppelin\contracts\token\ERC20\IERC20.sol

pragma solidity ^0.6.0;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP. Does not include
 * the optional functions; to access them see {ERC20Detailed}.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

// File: node_modules\@studydefi\money-legos\dydx\contracts\ISoloMargin.sol

pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;


library Account {
    enum Status {Normal, Liquid, Vapor}
    struct Info {
        address owner; // The address that owns the account
        uint256 number; // A nonce that allows a single address to control many accounts
    }
    struct Storage {
        mapping(uint256 => Types.Par) balances; // Mapping from marketId to principal
        Status status;
    }
}


library Actions {
    enum ActionType {
        Deposit, // supply tokens
        Withdraw, // borrow tokens
        Transfer, // transfer balance between accounts
        Buy, // buy an amount of some token (publicly)
        Sell, // sell an amount of some token (publicly)
        Trade, // trade tokens against another account
        Liquidate, // liquidate an undercollateralized or expiring account
        Vaporize, // use excess tokens to zero-out a completely negative account
        Call // send arbitrary data to an address
    }

    enum AccountLayout {OnePrimary, TwoPrimary, PrimaryAndSecondary}

    enum MarketLayout {ZeroMarkets, OneMarket, TwoMarkets}

    struct ActionArgs {
        ActionType actionType;
        uint256 accountId;
        Types.AssetAmount amount;
        uint256 primaryMarketId;
        uint256 secondaryMarketId;
        address otherAddress;
        uint256 otherAccountId;
        bytes data;
    }

    struct DepositArgs {
        Types.AssetAmount amount;
        Account.Info account;
        uint256 market;
        address from;
    }

    struct WithdrawArgs {
        Types.AssetAmount amount;
        Account.Info account;
        uint256 market;
        address to;
    }

    struct TransferArgs {
        Types.AssetAmount amount;
        Account.Info accountOne;
        Account.Info accountTwo;
        uint256 market;
    }

    struct BuyArgs {
        Types.AssetAmount amount;
        Account.Info account;
        uint256 makerMarket;
        uint256 takerMarket;
        address exchangeWrapper;
        bytes orderData;
    }

    struct SellArgs {
        Types.AssetAmount amount;
        Account.Info account;
        uint256 takerMarket;
        uint256 makerMarket;
        address exchangeWrapper;
        bytes orderData;
    }

    struct TradeArgs {
        Types.AssetAmount amount;
        Account.Info takerAccount;
        Account.Info makerAccount;
        uint256 inputMarket;
        uint256 outputMarket;
        address autoTrader;
        bytes tradeData;
    }

    struct LiquidateArgs {
        Types.AssetAmount amount;
        Account.Info solidAccount;
        Account.Info liquidAccount;
        uint256 owedMarket;
        uint256 heldMarket;
    }

    struct VaporizeArgs {
        Types.AssetAmount amount;
        Account.Info solidAccount;
        Account.Info vaporAccount;
        uint256 owedMarket;
        uint256 heldMarket;
    }

    struct CallArgs {
        Account.Info account;
        address callee;
        bytes data;
    }
}


library Decimal {
    struct D256 {
        uint256 value;
    }
}


library Interest {
    struct Rate {
        uint256 value;
    }

    struct Index {
        uint96 borrow;
        uint96 supply;
        uint32 lastUpdate;
    }
}


library Monetary {
    struct Price {
        uint256 value;
    }
    struct Value {
        uint256 value;
    }
}


library Storage {
    // All information necessary for tracking a market
    struct Market {
        // Contract address of the associated ERC20 token
        address token;
        // Total aggregated supply and borrow amount of the entire market
        Types.TotalPar totalPar;
        // Interest index of the market
        Interest.Index index;
        // Contract address of the price oracle for this market
        address priceOracle;
        // Contract address of the interest setter for this market
        address interestSetter;
        // Multiplier on the marginRatio for this market
        Decimal.D256 marginPremium;
        // Multiplier on the liquidationSpread for this market
        Decimal.D256 spreadPremium;
        // Whether additional borrows are allowed for this market
        bool isClosing;
    }

    // The global risk parameters that govern the health and security of the system
    struct RiskParams {
        // Required ratio of over-collateralization
        Decimal.D256 marginRatio;
        // Percentage penalty incurred by liquidated accounts
        Decimal.D256 liquidationSpread;
        // Percentage of the borrower's interest fee that gets passed to the suppliers
        Decimal.D256 earningsRate;
        // The minimum absolute borrow value of an account
        // There must be sufficient incentivize to liquidate undercollateralized accounts
        Monetary.Value minBorrowedValue;
    }

    // The maximum RiskParam values that can be set
    struct RiskLimits {
        uint64 marginRatioMax;
        uint64 liquidationSpreadMax;
        uint64 earningsRateMax;
        uint64 marginPremiumMax;
        uint64 spreadPremiumMax;
        uint128 minBorrowedValueMax;
    }

    // The entire storage state of Solo
    struct State {
        // number of markets
        uint256 numMarkets;
        // marketId => Market
        mapping(uint256 => Market) markets;
        // owner => account number => Account
        mapping(address => mapping(uint256 => Account.Storage)) accounts;
        // Addresses that can control other users accounts
        mapping(address => mapping(address => bool)) operators;
        // Addresses that can control all users accounts
        mapping(address => bool) globalOperators;
        // mutable risk parameters of the system
        RiskParams riskParams;
        // immutable risk limits of the system
        RiskLimits riskLimits;
    }
}


library Types {
    enum AssetDenomination {
        Wei, // the amount is denominated in wei
        Par // the amount is denominated in par
    }

    enum AssetReference {
        Delta, // the amount is given as a delta from the current value
        Target // the amount is given as an exact number to end up at
    }

    struct AssetAmount {
        bool sign; // true if positive
        AssetDenomination denomination;
        AssetReference ref;
        uint256 value;
    }

    struct TotalPar {
        uint128 borrow;
        uint128 supply;
    }

    struct Par {
        bool sign; // true if positive
        uint128 value;
    }

    struct Wei {
        bool sign; // true if positive
        uint256 value;
    }
}


abstract contract ISoloMargin {
    struct OperatorArg {
        address operator;
        bool trusted;
    }

    function ownerSetSpreadPremium(
        uint256 marketId,
        Decimal.D256 memory spreadPremium
    ) public virtual;

    function getIsGlobalOperator(address operator) public virtual view returns (bool);

    function getMarketTokenAddress(uint256 marketId)
        public virtual
        view
        returns (address);

    function ownerSetInterestSetter(uint256 marketId, address interestSetter)
        public virtual;

    function getAccountValues(Account.Info memory account)
        public virtual
        view
        returns (Monetary.Value memory, Monetary.Value memory);

    function getMarketPriceOracle(uint256 marketId)
        public virtual
        view
        returns (address);

    function getMarketInterestSetter(uint256 marketId)
        public virtual
        view
        returns (address);

    function getMarketSpreadPremium(uint256 marketId)
        public virtual
        view
        returns (Decimal.D256 memory);

    function getNumMarkets() public virtual view returns (uint256);

    function ownerWithdrawUnsupportedTokens(address token, address recipient)
        public virtual
        returns (uint256);

    function ownerSetMinBorrowedValue(Monetary.Value memory minBorrowedValue)
        public virtual;

    function ownerSetLiquidationSpread(Decimal.D256 memory spread) public virtual;

    function ownerSetEarningsRate(Decimal.D256 memory earningsRate) public virtual;

    function getIsLocalOperator(address owner, address operator)
        public virtual
        view
        returns (bool);

    function getAccountPar(Account.Info memory account, uint256 marketId)
        public virtual
        view
        returns (Types.Par memory);

    function ownerSetMarginPremium(
        uint256 marketId,
        Decimal.D256 memory marginPremium
    ) public virtual;

    function getMarginRatio() public virtual view returns (Decimal.D256 memory);

    function getMarketCurrentIndex(uint256 marketId)
        public virtual
        view
        returns (Interest.Index memory);

    function getMarketIsClosing(uint256 marketId) public virtual view returns (bool);

    function getRiskParams() public virtual view returns (Storage.RiskParams memory);

    function getAccountBalances(Account.Info memory account)
        public virtual
        view
        returns (address[] memory, Types.Par[] memory, Types.Wei[] memory);

    function renounceOwnership() public virtual;

    function getMinBorrowedValue() public virtual view returns (Monetary.Value memory);

    function setOperators(OperatorArg[] memory args) public virtual;

    function getMarketPrice(uint256 marketId) public virtual view returns (address);

    function owner() public  virtual view returns (address);

    function isOwner() public  virtual view returns (bool);

    function ownerWithdrawExcessTokens(uint256 marketId, address recipient)
        public virtual 
        returns (uint256);

    function ownerAddMarket(
        address token,
        address priceOracle,
        address interestSetter,
        Decimal.D256 memory marginPremium,
        Decimal.D256 memory spreadPremium
    ) public virtual ;

    function operate(
        Account.Info[] memory accounts,
        Actions.ActionArgs[] memory actions
    ) public virtual ;

    function getMarketWithInfo(uint256 marketId)
        public virtual 
        view
        returns (
            Storage.Market memory,
            Interest.Index memory,
            Monetary.Price memory,
            Interest.Rate memory
        );

    function ownerSetMarginRatio(Decimal.D256 memory ratio) public virtual ;

    function getLiquidationSpread() public  virtual view returns (Decimal.D256 memory);

    function getAccountWei(Account.Info memory account, uint256 marketId)
        public virtual 
        view
        returns (Types.Wei memory);

    function getMarketTotalPar(uint256 marketId)
        public virtual 
        view
        returns (Types.TotalPar memory);

    function getLiquidationSpreadForPair(
        uint256 heldMarketId,
        uint256 owedMarketId
    ) public virtual  view returns (Decimal.D256 memory);

    function getNumExcessTokens(uint256 marketId)
        public virtual 
        view
        returns (Types.Wei memory);

    function getMarketCachedIndex(uint256 marketId)
        public virtual 
        view
        returns (Interest.Index memory);

    function getAccountStatus(Account.Info memory account)
        public virtual 
        view
        returns (uint8);

    function getEarningsRate() public virtual  view returns (Decimal.D256 memory);

    function ownerSetPriceOracle(uint256 marketId, address priceOracle) public virtual ;

    function getRiskLimits() public  virtual view returns (Storage.RiskLimits memory);

    function getMarket(uint256 marketId)
        public virtual 
        view
        returns (Storage.Market memory);

    function ownerSetIsClosing(uint256 marketId, bool isClosing) public virtual ;

    function ownerSetGlobalOperator(address operator, bool approved) public virtual ;

    function transferOwnership(address newOwner) public virtual ;

    function getAdjustedAccountValues(Account.Info memory account)
        public virtual 
        view
        returns (Monetary.Value memory, Monetary.Value memory);

    function getMarketMarginPremium(uint256 marketId)
        public virtual 
        view
        returns (Decimal.D256 memory);

    function getMarketInterestRate(uint256 marketId)
        public virtual 
        view
        returns (Interest.Rate memory);
}

// File: @studydefi\money-legos\dydx\contracts\DydxFlashloanBase.sol

pragma solidity ^0.6.0;





contract DydxFlashloanBase {
    using SafeMath for uint256;

    // -- Internal Helper functions -- //

    function _getMarketIdFromTokenAddress(address _solo, address token)
        internal
        view
        returns (uint256)
    {
        ISoloMargin solo = ISoloMargin(_solo);

        uint256 numMarkets = solo.getNumMarkets();

        address curToken;
        for (uint256 i = 0; i < numMarkets; i++) {
            curToken = solo.getMarketTokenAddress(i);

            if (curToken == token) {
                return i;
            }
        }

        revert("No marketId found for provided token");
    }

    function _getRepaymentAmountInternal(uint256 amount)
        internal
        view
        returns (uint256)
    {
        // Needs to be overcollateralize
        // Needs to provide +2 wei to be safe
        return amount.add(2);
    }

    function _getAccountInfo() internal view returns (Account.Info memory) {
        return Account.Info({owner: address(this), number: 1});
    }

    function _getWithdrawAction(uint marketId, uint256 amount)
        internal
        view
        returns (Actions.ActionArgs memory)
    {
        return
            Actions.ActionArgs({
                actionType: Actions.ActionType.Withdraw,
                accountId: 0,
                amount: Types.AssetAmount({
                    sign: false,
                    denomination: Types.AssetDenomination.Wei,
                    ref: Types.AssetReference.Delta,
                    value: amount
                }),
                primaryMarketId: marketId,
                secondaryMarketId: 0,
                otherAddress: address(this),
                otherAccountId: 0,
                data: ""
            });
    }

    function _getCallAction(bytes memory data)
        internal
        view
        returns (Actions.ActionArgs memory)
    {
        return
            Actions.ActionArgs({
                actionType: Actions.ActionType.Call,
                accountId: 0,
                amount: Types.AssetAmount({
                    sign: false,
                    denomination: Types.AssetDenomination.Wei,
                    ref: Types.AssetReference.Delta,
                    value: 0
                }),
                primaryMarketId: 0,
                secondaryMarketId: 0,
                otherAddress: address(this),
                otherAccountId: 0,
                data: data
            });
    }

    function _getDepositAction(uint marketId, uint256 amount)
        internal
        view
        returns (Actions.ActionArgs memory)
    {
        return
            Actions.ActionArgs({
                actionType: Actions.ActionType.Deposit,
                accountId: 0,
                amount: Types.AssetAmount({
                    sign: true,
                    denomination: Types.AssetDenomination.Wei,
                    ref: Types.AssetReference.Delta,
                    value: amount
                }),
                primaryMarketId: marketId,
                secondaryMarketId: 0,
                otherAddress: address(this),
                otherAccountId: 0,
                data: ""
            });
    }
}

// File: @studydefi\money-legos\dydx\contracts\ICallee.sol

pragma solidity ^0.6.0;


/**
 * @title ICallee
 * @author dYdX
 *
 * Interface that Callees for Solo must implement in order to ingest data.
 */
abstract contract ICallee {

    // ============ Public Functions ============

    /**
     * Allows users to send this contract arbitrary data.
     *
     * @param  sender       The msg.sender to Solo
     * @param  accountInfo  The account from which the data is being sent
     * @param  data         Arbitrary data given by the sender
     */
     function callFunction(
        address sender,
        Account.Info memory accountInfo,
        bytes memory data
    )
        public virtual;
}

// File: @studydefi\money-legos\onesplit\contracts\IOneSplit.sol

pragma solidity ^0.6.0;



contract IOneSplitConsts {
    // disableFlags = FLAG_DISABLE_UNISWAP + FLAG_DISABLE_KYBER + ...
    uint256 public constant FLAG_DISABLE_UNISWAP = 0x01;
    uint256 public constant FLAG_DISABLE_KYBER = 0x02;
    uint256 public constant FLAG_ENABLE_KYBER_UNISWAP_RESERVE = 0x100000000; // Turned off by default
    uint256 public constant FLAG_ENABLE_KYBER_OASIS_RESERVE = 0x200000000; // Turned off by default
    uint256 public constant FLAG_ENABLE_KYBER_BANCOR_RESERVE = 0x400000000; // Turned off by default
    uint256 public constant FLAG_DISABLE_BANCOR = 0x04;
    uint256 public constant FLAG_DISABLE_OASIS = 0x08;
    uint256 public constant FLAG_DISABLE_COMPOUND = 0x10;
    uint256 public constant FLAG_DISABLE_FULCRUM = 0x20;
    uint256 public constant FLAG_DISABLE_CHAI = 0x40;
    uint256 public constant FLAG_DISABLE_AAVE = 0x80;
    uint256 public constant FLAG_DISABLE_SMART_TOKEN = 0x100;
    uint256 public constant FLAG_ENABLE_MULTI_PATH_ETH = 0x200; // Turned off by default
    uint256 public constant FLAG_DISABLE_BDAI = 0x400;
    uint256 public constant FLAG_DISABLE_IEARN = 0x800;
    uint256 public constant FLAG_DISABLE_CURVE_COMPOUND = 0x1000;
    uint256 public constant FLAG_DISABLE_CURVE_USDT = 0x2000;
    uint256 public constant FLAG_DISABLE_CURVE_Y = 0x4000;
    uint256 public constant FLAG_DISABLE_CURVE_BINANCE = 0x8000;
    uint256 public constant FLAG_ENABLE_MULTI_PATH_DAI = 0x10000; // Turned off by default
    uint256 public constant FLAG_ENABLE_MULTI_PATH_USDC = 0x20000; // Turned off by default
    uint256 public constant FLAG_DISABLE_CURVE_SYNTHETIX = 0x40000;
    uint256 public constant FLAG_DISABLE_WETH = 0x80000;
    uint256 public constant FLAG_ENABLE_UNISWAP_COMPOUND = 0x100000; // Works only when one of assets is ETH or FLAG_ENABLE_MULTI_PATH_ETH
    uint256 public constant FLAG_ENABLE_UNISWAP_CHAI = 0x200000; // Works only when ETH<>DAI or FLAG_ENABLE_MULTI_PATH_ETH
    uint256 public constant FLAG_ENABLE_UNISWAP_AAVE = 0x400000; // Works only when one of assets is ETH or FLAG_ENABLE_MULTI_PATH_ETH
    uint256 public constant FLAG_DISABLE_IDLE = 0x800000;
}


abstract contract IOneSplit is IOneSplitConsts {
    function getExpectedReturn(
        IERC20 fromToken,
        IERC20 toToken,
        uint256 amount,
        uint256 parts,
        uint256 disableFlags
    )
        public virtual 
        view
        returns(
            uint256 returnAmount,
            uint256[] memory distribution
        );

    function swap(
        IERC20 fromToken,
        IERC20 toToken,
        uint256 amount,
        uint256 minReturn,
        uint256[] memory distribution,
        uint256 disableFlags
    ) public virtual  payable;
}

// File: contracts\DydxFlashLoaner.sol

pragma solidity ^0.6.0;

contract DydxFlashloaner is ICallee, DydxFlashloanBase {
    event Logger(uint256 number, uint256 amount);

    struct MyCustomData {
        address token;
		uint256 initialAmount;
        uint256 finalRepayAmount;
		address[] sequences;
		uint256[] returnAmounts;
		uint[] distributions;
		uint parts;
    }
	
	address payable public spender = msg.sender;
	
	address constant OneSplitAddress = 0xC586BeF4a0992C495Cf22e1aeEE4E446CECDee0E;
	
	modifier onlyOwner () {
		require(msg.sender == address(spender));
		_;
	}
	
	fallback() external payable { }

	function withdraw(uint256 _amount) external payable onlyOwner returns (bool) {
		spender.transfer(_amount);		
	}

	function approve(address _token, uint256 _amount) external onlyOwner returns (bool) {
		return IERC20(_token).approve(spender, _amount);
	}

	function withdrawToken(address _token, uint256 _amount) external onlyOwner returns (bool) {
		return IERC20(_token).transfer(spender, _amount);
	}

	// This is the function that will be called postLoan
    // i.e. Encode the logic to handle your flashloaned funds here
    function callFunction  (
        address sender,
        Account.Info memory account,
        bytes memory data
    ) public override {
        
		MyCustomData memory mcd = abi.decode(data, (MyCustomData));
        uint256 balOfLoanedToken = IERC20(mcd.token).balanceOf(address(this));

        // Note that you can ignore the line below
        // if your dydx account (this contract in this case)
        // has deposited at least ~2 Wei of assets into the account
        // to balance out the collaterization ratio
        require(
            balOfLoanedToken >= mcd.finalRepayAmount,
            "Do Not have enough funds to repay dydx loan!"
        );

		uint256 swapAmount = mcd.initialAmount;
		
		for(uint ii=1; ii < mcd.sequences.length; ++ii)
		{
			IERC20 fromIERC20 = IERC20(mcd.sequences[ii-1]);
			IERC20 toIERC20 = IERC20(mcd.sequences[ii]);
			uint[] memory dist;	
			
			for(uint jj=0; jj < mcd.parts; ++jj)
			{
				dist[jj] = mcd.distributions[jj+(ii-1)*mcd.parts];
			}
			
			IOneSplit(OneSplitAddress).swap(
				fromIERC20,
				toIERC20,
				swapAmount,
				mcd.returnAmounts[ii-1],
				dist,
				0
			);
			
			swapAmount = mcd.returnAmounts[ii-1];
		}

        require(swapAmount > mcd.initialAmount, 'swap not profitable');
	}

    function initateFlashLoan(address _solo, address _token, uint256 _amount, 
	                          address[] calldata _sequences, 
							  uint256[] calldata _returnAmounts,
							  uint[] calldata _distributions, uint _parts)
        external
    {
		emit Logger(10, 10);
        ISoloMargin solo = ISoloMargin(_solo);

        // Get marketId from token address
        uint256 marketId = _getMarketIdFromTokenAddress(_solo, _token);

        // Calculate repay amount (_amount + (2 wei))
        // Approve transfer from
        uint256 repayAmount = _getRepaymentAmountInternal(_amount);
        IERC20(_token).approve(_solo, repayAmount);
		
		
        // 1. Withdraw $
        // 2. Call callFunction(...)
        // 3. Deposit back $
        Actions.ActionArgs[] memory operations = new Actions.ActionArgs[](3);
		emit Logger(0, 0);
        operations[0] = _getWithdrawAction(marketId, _amount);
		emit Logger(0, 1);
        operations[1] = _getCallAction(
            // Encode MyCustomData for callFunction
            abi.encode(MyCustomData({token: _token, finalRepayAmount: repayAmount, 
									 initialAmount: _amount,
			                         sequences: _sequences, returnAmounts: _returnAmounts,
									 distributions: _distributions, parts: _parts}))
        );
		
		emit Logger(0, 2);
        operations[2] = _getDepositAction(marketId, repayAmount);

        Account.Info[] memory accountInfos = new Account.Info[](1);
        accountInfos[0] = _getAccountInfo();

        solo.operate(accountInfos, operations);
    }
}
